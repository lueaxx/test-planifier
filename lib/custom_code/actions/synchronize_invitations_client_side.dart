// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> synchronizeInvitationsClientSide(
  DocumentReference userRef,
  String email,
) async {
  final firestore = FirebaseFirestore.instance;

  // Busca en TODAS las subcolecciones 'participantes' invitaciones para este email.
  final invitationsQuery = firestore
      .collectionGroup('participantes')
      .where('email', isEqualTo: email)
      .where('status', isEqualTo: 'invitado');

  final invitationsSnapshot = await invitationsQuery.get();

  if (invitationsSnapshot.docs.isEmpty) {
    // No hay invitaciones, no hacemos nada más que marcar al usuario como sincronizado.
    await userRef.update({'initial_sync_complete': true});
    return;
  }

  // --- NUEVO: 1. OBTENER LOS DATOS DEL USUARIO ---
  // Leemos el documento del usuario para obtener su nombre.
  final userDoc = await userRef.get();
  // Asumimos que el campo se llama 'display_name'. Cambia si se llama diferente.
  final userName = userDoc.data() != null
      ? (userDoc.data()! as Map<String, dynamic>)['display_name']
      : null;

  final batch = firestore.batch();

  invitationsSnapshot.docs.forEach((doc) {
    // Preparamos los datos para la actualización
    final Map<String, dynamic> dataToUpdate = {
      'status': 'activo',
      'user_ref': userRef,
    };

    // --- MODIFICADO: 2. AGREGAR EL NOMBRE SI EXISTE ---
    // Si encontramos un nombre, lo agregamos a los datos a actualizar.
    if (userName != null && userName.isNotEmpty) {
      // Asegúrate que el campo en 'participantes' se llame 'user_name' o como corresponda.
      dataToUpdate['display_name'] = userName;
    }

    // Actualiza la invitación para activarla y vincularla al usuario.
    batch.update(doc.reference, dataToUpdate);
  });

  // Marca al usuario como sincronizado para no volver a ejecutar esto.
  batch.update(userRef, {'initial_sync_complete': true});

  await batch.commit();
}
