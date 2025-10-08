import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DireccionRecord extends FirestoreRecord {
  DireccionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "default_address" field.
  bool? _defaultAddress;
  bool get defaultAddress => _defaultAddress ?? false;
  bool hasDefaultAddress() => _defaultAddress != null;

  // "alias" field.
  String? _alias;
  String get alias => _alias ?? '';
  bool hasAlias() => _alias != null;

  // "calle" field.
  String? _calle;
  String get calle => _calle ?? '';
  bool hasCalle() => _calle != null;

  // "altura" field.
  String? _altura;
  String get altura => _altura ?? '';
  bool hasAltura() => _altura != null;

  // "piso" field.
  String? _piso;
  String get piso => _piso ?? '';
  bool hasPiso() => _piso != null;

  // "dpto" field.
  String? _dpto;
  String get dpto => _dpto ?? '';
  bool hasDpto() => _dpto != null;

  // "codigo_postal" field.
  String? _codigoPostal;
  String get codigoPostal => _codigoPostal ?? '';
  bool hasCodigoPostal() => _codigoPostal != null;

  // "localidad" field.
  String? _localidad;
  String get localidad => _localidad ?? '';
  bool hasLocalidad() => _localidad != null;

  // "provincia" field.
  String? _provincia;
  String get provincia => _provincia ?? '';
  bool hasProvincia() => _provincia != null;

  // "entre_calles" field.
  String? _entreCalles;
  String get entreCalles => _entreCalles ?? '';
  bool hasEntreCalles() => _entreCalles != null;

  void _initializeFields() {
    _owner = snapshotData['owner'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _defaultAddress = snapshotData['default_address'] as bool?;
    _alias = snapshotData['alias'] as String?;
    _calle = snapshotData['calle'] as String?;
    _altura = snapshotData['altura'] as String?;
    _piso = snapshotData['piso'] as String?;
    _dpto = snapshotData['dpto'] as String?;
    _codigoPostal = snapshotData['codigo_postal'] as String?;
    _localidad = snapshotData['localidad'] as String?;
    _provincia = snapshotData['provincia'] as String?;
    _entreCalles = snapshotData['entre_calles'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('direccion');

  static Stream<DireccionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DireccionRecord.fromSnapshot(s));

  static Future<DireccionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DireccionRecord.fromSnapshot(s));

  static DireccionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DireccionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DireccionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DireccionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DireccionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DireccionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDireccionRecordData({
  DocumentReference? owner,
  DateTime? createdAt,
  bool? defaultAddress,
  String? alias,
  String? calle,
  String? altura,
  String? piso,
  String? dpto,
  String? codigoPostal,
  String? localidad,
  String? provincia,
  String? entreCalles,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'owner': owner,
      'created_at': createdAt,
      'default_address': defaultAddress,
      'alias': alias,
      'calle': calle,
      'altura': altura,
      'piso': piso,
      'dpto': dpto,
      'codigo_postal': codigoPostal,
      'localidad': localidad,
      'provincia': provincia,
      'entre_calles': entreCalles,
    }.withoutNulls,
  );

  return firestoreData;
}

class DireccionRecordDocumentEquality implements Equality<DireccionRecord> {
  const DireccionRecordDocumentEquality();

  @override
  bool equals(DireccionRecord? e1, DireccionRecord? e2) {
    return e1?.owner == e2?.owner &&
        e1?.createdAt == e2?.createdAt &&
        e1?.defaultAddress == e2?.defaultAddress &&
        e1?.alias == e2?.alias &&
        e1?.calle == e2?.calle &&
        e1?.altura == e2?.altura &&
        e1?.piso == e2?.piso &&
        e1?.dpto == e2?.dpto &&
        e1?.codigoPostal == e2?.codigoPostal &&
        e1?.localidad == e2?.localidad &&
        e1?.provincia == e2?.provincia &&
        e1?.entreCalles == e2?.entreCalles;
  }

  @override
  int hash(DireccionRecord? e) => const ListEquality().hash([
        e?.owner,
        e?.createdAt,
        e?.defaultAddress,
        e?.alias,
        e?.calle,
        e?.altura,
        e?.piso,
        e?.dpto,
        e?.codigoPostal,
        e?.localidad,
        e?.provincia,
        e?.entreCalles
      ]);

  @override
  bool isValidKey(Object? o) => o is DireccionRecord;
}
