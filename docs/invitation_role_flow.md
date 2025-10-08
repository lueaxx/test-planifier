# Flujo de asignación de roles para invitaciones

Este documento describe la arquitectura propuesta y los pasos en FlutterFlow/Firestore para completar el flujo solicitado: cuando un usuario sin permisos genera una invitación a un evento, el propietario recibe una solicitud y debe asignar manualmente un rol (Visualizador, Colaborador, Editor u Owner). Una vez asignado el rol, la persona pasa a ver el evento en su listado.

## 1. Estructura de datos recomendada

### Colección `events`
- **Campos sugeridos**:
  - `name` *(string)*: título del evento.
  - `ownerRef` *(DocumentReference a `users`)*: usuario propietario.
  - `roles` *(map<string, string>)*: mapa `userId -> role` con roles activos.
  - `pendingRequests` *(array de DocumentReference a `eventRequests`)* *(opcional)*: referencias a solicitudes pendientes si quieres denormalizar para consultas más rápidas.

### Colección `eventInvites`
- Un documento por invitación enviada.
- **Campos**:
  - `eventRef` *(DocumentReference a `events`)*.
  - `invitedEmail` *(string)*: correo del invitado.
  - `invitedUserRef` *(DocumentReference a `users`)* *(opcional, solo si ya existe en tu sistema)*.
  - `status` *(string)*: `pending`, `accepted`, `rejected`, `cancelled`.
  - `requestedRole` *(string)*: rol sugerido si la persona pidió uno específico.
  - `createdByRef` *(DocumentReference a `users`)*: usuario que generó la invitación (puede no ser owner).
  - `createdAt` *(timestamp)*.

### Colección `eventRequests`
- Registra las solicitudes que requieren aprobación del owner.
- **Campos**:
  - `eventRef` *(DocumentReference a `events`)*.
  - `requesterRef` *(DocumentReference a `users`)*.
  - `requesterEmail` *(string)*: respaldo para usuarios sin cuenta.
  - `requesterName` *(string)*.
  - `inviteRef` *(DocumentReference a `eventInvites`)* *(opcional pero útil para trazabilidad)*.
  - `status` *(string)*: `pending`, `approved`, `rejected`.
  - `assignedRole` *(string, nullable)*: rol aprobado por el owner.
  - `createdAt`, `updatedAt` *(timestamp)*.

> **Tip**: Si prefieres una estructura más simple, puedes incorporar el estado en la colección `eventInvites` y filtrar por invitaciones donde `status == 'pending'` y `createdByRef != owner`. La separación en `eventRequests` ayuda a mantener un historial claro.

## 2. Lógica de creación de invitaciones
1. Usuario sin permisos inicia el flujo de "Invitar".
2. Se crea un documento en `eventInvites` con `status = 'pending'` y se vincula al evento.
3. Se crea (o actualiza) una solicitud en `eventRequests` con `status = 'pending'`.
4. Opcional: dispara un Cloud Function o automation en FlutterFlow para notificar al owner (correo, push notification, etc.).

### Seguridad
- Reglas de Firestore: permitir creación de invitaciones a usuarios autenticados que tengan `role` al menos `viewer`, pero bloquear la escritura directa en el `roles` map del evento.
- Solo el owner podrá actualizar `eventRequests.status` distinto de `pending` y modificar el `roles` map del evento.

## 3. Pantalla "Solicitudes"

### Fuente de datos
- Consulta a `eventRequests` filtrando por `eventRef == currentEvent` y `status == 'pending'`.
- Ordenar por `createdAt` descendente.

### UI
- ListView con tarjetas/botones como en la captura: avatar, nombre, botones para rechazar (`X`) o aceptar (`✓`).
- Al presionar aceptar, abrir modal con:
  - Dropdown de roles (`Viewer`, `Colaborador`, `Editor`, `Owner`).
  - Botón "Aceptar" para confirmar.

### Acciones en FlutterFlow
1. **Aceptar**
   - Acción 1: `Update Document` en `eventRequests` para:
     - `status = 'approved'`
     - `assignedRole = dropdownValue`
     - `updatedAt = now`
   - Acción 2: `Update Document` en `events` (o subcolección `roles`) para setear `roles.requesterId = dropdownValue`.
   - Acción 3 (opcional): `Update Document` en `eventInvites` asociado para marcar `status = 'accepted'`.
   - Acción 4: Navegar hacia atrás o mostrar snackbar de confirmación.

2. **Rechazar**
   - `Update Document` en `eventRequests` -> `status = 'rejected'`, `updatedAt = now`.
   - (Opcional) `Update Document` en `eventInvites` -> `status = 'rejected'`.

## 4. Pantalla de detalle del evento

En la pantalla de detalle del evento, muestra el menú con las secciones principales (Información, Tareas, Documentos, Solicitudes, etc.). Para evidenciar cuántas acciones están pendientes, agrega un contador entre paréntesis en los ítems relevantes.

- **Documentos**: consulta la colección que uses para los archivos pendientes de aprobación. Filtra por `status == 'pending'` y por el evento actual. En FlutterFlow puedes usar un `Future/Stream` secundario (por ejemplo, `FFAppState.pendingDocumentsCount`) o un `Query` directo y envolver el texto del ítem con una `Conditional` que muestre `"Documentos (X pendientes)"` cuando `X > 0`.
- **Solicitudes**: reutiliza la consulta de la pantalla "Solicitudes" (`eventRequests` con `status == 'pending'`). Calcula el total y muéstralo como `"Solicitudes (X pendientes)"` resaltado en color primario para llamar la atención.
- **Estados sin pendientes**: si `X == 0`, deja solo el nombre de la sección sin paréntesis para evitar ruido visual.

> **Tip**: si ya tienes un `ListView` con los botones, crea un widget personalizado para el ítem de menú que reciba el texto base y el contador opcional. De esta forma reutilizas la misma lógica para futuras secciones que necesiten indicadores.

## 5. Visibilidad del evento en la lista
- El listado de eventos del usuario debe consultar eventos donde:
  - `ownerRef == currentUser` **o**
  - `roles[currentUser.uid]` exista **o**
  - existe documento en `eventInvites` con `invitedUserRef == currentUser` y `status == 'accepted'`.
- Cuando el owner aprueba la solicitud y actualiza el `roles` map, el evento aparecerá automáticamente si la consulta utiliza la condición anterior.

## 6. Automatizaciones/Notificaciones
- **Para el owner**: usar un trigger (Cloud Function / FlutterFlow Backend) que escuche nuevas solicitudes `status = 'pending'` y envíe notificación push o email.
- **Para el solicitante**: tras actualizar a `status = 'approved'` o `rejected`, disparar notificación.

## 7. Consideraciones adicionales
- **Auditoría**: guarda un `history` array o subcolección `eventRequestLogs` con registros de cambios (quién aprobó, cuándo, rol asignado).
- **Reasignación de roles**: permite que el owner entre a una pantalla de gestión de roles con la misma UI de dropdown.
- **Expiración de invitaciones**: campo `expiresAt` en `eventInvites` para auto-cancelar solicitudes antiguas.
- **Validaciones**: evita que el owner se degrade quitando su propio rol Owner.

## 8. Siguiente pasos recomendados en FlutterFlow
1. Crear las colecciones y campos mencionados en Firestore.
2. Configurar páginas: "Solicitudes" y modal "Asignar rol" con las acciones listadas.
3. Añadir `Action Flows` para notificaciones y actualizaciones.
4. Ajustar reglas de Firestore para reflejar la lógica de permisos.
5. Probar el flujo completo con usuarios de prueba.

Con estos pasos, el owner controlará explícitamente la incorporación de nuevos miembros y su rol dentro de cada evento.
