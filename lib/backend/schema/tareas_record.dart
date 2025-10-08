import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TareasRecord extends FirestoreRecord {
  TareasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "usuario_asignado_ref" field.
  DocumentReference? _usuarioAsignadoRef;
  DocumentReference? get usuarioAsignadoRef => _usuarioAsignadoRef;
  bool hasUsuarioAsignadoRef() => _usuarioAsignadoRef != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "prioridad" field.
  String? _prioridad;
  String get prioridad => _prioridad ?? '';
  bool hasPrioridad() => _prioridad != null;

  // "vencimiento" field.
  DateTime? _vencimiento;
  DateTime? get vencimiento => _vencimiento;
  bool hasVencimiento() => _vencimiento != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _descripcion = snapshotData['descripcion'] as String?;
    _usuarioAsignadoRef =
        snapshotData['usuario_asignado_ref'] as DocumentReference?;
    _nombre = snapshotData['nombre'] as String?;
    _status = snapshotData['status'] as String?;
    _prioridad = snapshotData['prioridad'] as String?;
    _vencimiento = snapshotData['vencimiento'] as DateTime?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tareas')
          : FirebaseFirestore.instance.collectionGroup('tareas');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('tareas').doc(id);

  static Stream<TareasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TareasRecord.fromSnapshot(s));

  static Future<TareasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TareasRecord.fromSnapshot(s));

  static TareasRecord fromSnapshot(DocumentSnapshot snapshot) => TareasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TareasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TareasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TareasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TareasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTareasRecordData({
  String? descripcion,
  DocumentReference? usuarioAsignadoRef,
  String? nombre,
  String? status,
  String? prioridad,
  DateTime? vencimiento,
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'descripcion': descripcion,
      'usuario_asignado_ref': usuarioAsignadoRef,
      'nombre': nombre,
      'status': status,
      'prioridad': prioridad,
      'vencimiento': vencimiento,
      'created_at': createdAt,
      'updated_at': updatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class TareasRecordDocumentEquality implements Equality<TareasRecord> {
  const TareasRecordDocumentEquality();

  @override
  bool equals(TareasRecord? e1, TareasRecord? e2) {
    return e1?.descripcion == e2?.descripcion &&
        e1?.usuarioAsignadoRef == e2?.usuarioAsignadoRef &&
        e1?.nombre == e2?.nombre &&
        e1?.status == e2?.status &&
        e1?.prioridad == e2?.prioridad &&
        e1?.vencimiento == e2?.vencimiento &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt;
  }

  @override
  int hash(TareasRecord? e) => const ListEquality().hash([
        e?.descripcion,
        e?.usuarioAsignadoRef,
        e?.nombre,
        e?.status,
        e?.prioridad,
        e?.vencimiento,
        e?.createdAt,
        e?.updatedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is TareasRecord;
}
