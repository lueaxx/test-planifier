import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Colección estática: Personal, Empresarial
class TipoCuentaRecord extends FirestoreRecord {
  TipoCuentaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombre_tipo" field.
  String? _nombreTipo;
  String get nombreTipo => _nombreTipo ?? '';
  bool hasNombreTipo() => _nombreTipo != null;

  void _initializeFields() {
    _nombreTipo = snapshotData['nombre_tipo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Tipo_Cuenta');

  static Stream<TipoCuentaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TipoCuentaRecord.fromSnapshot(s));

  static Future<TipoCuentaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TipoCuentaRecord.fromSnapshot(s));

  static TipoCuentaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TipoCuentaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TipoCuentaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TipoCuentaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TipoCuentaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TipoCuentaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTipoCuentaRecordData({
  String? nombreTipo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre_tipo': nombreTipo,
    }.withoutNulls,
  );

  return firestoreData;
}

class TipoCuentaRecordDocumentEquality implements Equality<TipoCuentaRecord> {
  const TipoCuentaRecordDocumentEquality();

  @override
  bool equals(TipoCuentaRecord? e1, TipoCuentaRecord? e2) {
    return e1?.nombreTipo == e2?.nombreTipo;
  }

  @override
  int hash(TipoCuentaRecord? e) => const ListEquality().hash([e?.nombreTipo]);

  @override
  bool isValidKey(Object? o) => o is TipoCuentaRecord;
}
