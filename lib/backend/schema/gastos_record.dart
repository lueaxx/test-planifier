import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GastosRecord extends FirestoreRecord {
  GastosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;

  /// nombre del gasto
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "categoria" field.
  String? _categoria;

  /// por ejemplo: catering, bebidas
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "monto_total" field.
  double? _montoTotal;
  double get montoTotal => _montoTotal ?? 0.0;
  bool hasMontoTotal() => _montoTotal != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "id_tarea" field.
  DocumentReference? _idTarea;
  DocumentReference? get idTarea => _idTarea;
  bool hasIdTarea() => _idTarea != null;

  // "creado_por_ref" field.
  DocumentReference? _creadoPorRef;
  DocumentReference? get creadoPorRef => _creadoPorRef;
  bool hasCreadoPorRef() => _creadoPorRef != null;

  // "estado_aprobacion" field.
  String? _estadoAprobacion;

  /// pendiente, aprobado, etc
  String get estadoAprobacion => _estadoAprobacion ?? '';
  bool hasEstadoAprobacion() => _estadoAprobacion != null;

  // "divide_gasto" field.
  bool? _divideGasto;
  bool get divideGasto => _divideGasto ?? false;
  bool hasDivideGasto() => _divideGasto != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _categoria = snapshotData['categoria'] as String?;
    _montoTotal = castToType<double>(snapshotData['monto_total']);
    _fecha = snapshotData['fecha'] as DateTime?;
    _idTarea = snapshotData['id_tarea'] as DocumentReference?;
    _creadoPorRef = snapshotData['creado_por_ref'] as DocumentReference?;
    _estadoAprobacion = snapshotData['estado_aprobacion'] as String?;
    _divideGasto = snapshotData['divide_gasto'] as bool?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('gastos')
          : FirebaseFirestore.instance.collectionGroup('gastos');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('gastos').doc(id);

  static Stream<GastosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GastosRecord.fromSnapshot(s));

  static Future<GastosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GastosRecord.fromSnapshot(s));

  static GastosRecord fromSnapshot(DocumentSnapshot snapshot) => GastosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GastosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GastosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GastosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GastosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGastosRecordData({
  String? nombre,
  String? descripcion,
  String? categoria,
  double? montoTotal,
  DateTime? fecha,
  DocumentReference? idTarea,
  DocumentReference? creadoPorRef,
  String? estadoAprobacion,
  bool? divideGasto,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'descripcion': descripcion,
      'categoria': categoria,
      'monto_total': montoTotal,
      'fecha': fecha,
      'id_tarea': idTarea,
      'creado_por_ref': creadoPorRef,
      'estado_aprobacion': estadoAprobacion,
      'divide_gasto': divideGasto,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class GastosRecordDocumentEquality implements Equality<GastosRecord> {
  const GastosRecordDocumentEquality();

  @override
  bool equals(GastosRecord? e1, GastosRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.descripcion == e2?.descripcion &&
        e1?.categoria == e2?.categoria &&
        e1?.montoTotal == e2?.montoTotal &&
        e1?.fecha == e2?.fecha &&
        e1?.idTarea == e2?.idTarea &&
        e1?.creadoPorRef == e2?.creadoPorRef &&
        e1?.estadoAprobacion == e2?.estadoAprobacion &&
        e1?.divideGasto == e2?.divideGasto &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(GastosRecord? e) => const ListEquality().hash([
        e?.nombre,
        e?.descripcion,
        e?.categoria,
        e?.montoTotal,
        e?.fecha,
        e?.idTarea,
        e?.creadoPorRef,
        e?.estadoAprobacion,
        e?.divideGasto,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is GastosRecord;
}
