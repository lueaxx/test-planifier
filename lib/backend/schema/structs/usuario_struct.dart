// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UsuarioStruct extends FFFirebaseStruct {
  UsuarioStruct({
    String? apellido,
    String? email,
    DateTime? fechaRegistro,
    int? idTipoCuenta,
    String? nombre,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _apellido = apellido,
        _email = email,
        _fechaRegistro = fechaRegistro,
        _idTipoCuenta = idTipoCuenta,
        _nombre = nombre,
        super(firestoreUtilData);

  // "apellido" field.
  String? _apellido;
  String get apellido => _apellido ?? '';
  set apellido(String? val) => _apellido = val;

  bool hasApellido() => _apellido != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "fecha_registro" field.
  DateTime? _fechaRegistro;
  DateTime? get fechaRegistro => _fechaRegistro;
  set fechaRegistro(DateTime? val) => _fechaRegistro = val;

  bool hasFechaRegistro() => _fechaRegistro != null;

  // "id_tipo_cuenta" field.
  int? _idTipoCuenta;
  int get idTipoCuenta => _idTipoCuenta ?? 0;
  set idTipoCuenta(int? val) => _idTipoCuenta = val;

  void incrementIdTipoCuenta(int amount) =>
      idTipoCuenta = idTipoCuenta + amount;

  bool hasIdTipoCuenta() => _idTipoCuenta != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  set nombre(String? val) => _nombre = val;

  bool hasNombre() => _nombre != null;

  static UsuarioStruct fromMap(Map<String, dynamic> data) => UsuarioStruct(
        apellido: data['apellido'] as String?,
        email: data['email'] as String?,
        fechaRegistro: data['fecha_registro'] as DateTime?,
        idTipoCuenta: castToType<int>(data['id_tipo_cuenta']),
        nombre: data['nombre'] as String?,
      );

  static UsuarioStruct? maybeFromMap(dynamic data) =>
      data is Map ? UsuarioStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'apellido': _apellido,
        'email': _email,
        'fecha_registro': _fechaRegistro,
        'id_tipo_cuenta': _idTipoCuenta,
        'nombre': _nombre,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'apellido': serializeParam(
          _apellido,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'fecha_registro': serializeParam(
          _fechaRegistro,
          ParamType.DateTime,
        ),
        'id_tipo_cuenta': serializeParam(
          _idTipoCuenta,
          ParamType.int,
        ),
        'nombre': serializeParam(
          _nombre,
          ParamType.String,
        ),
      }.withoutNulls;

  static UsuarioStruct fromSerializableMap(Map<String, dynamic> data) =>
      UsuarioStruct(
        apellido: deserializeParam(
          data['apellido'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        fechaRegistro: deserializeParam(
          data['fecha_registro'],
          ParamType.DateTime,
          false,
        ),
        idTipoCuenta: deserializeParam(
          data['id_tipo_cuenta'],
          ParamType.int,
          false,
        ),
        nombre: deserializeParam(
          data['nombre'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UsuarioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UsuarioStruct &&
        apellido == other.apellido &&
        email == other.email &&
        fechaRegistro == other.fechaRegistro &&
        idTipoCuenta == other.idTipoCuenta &&
        nombre == other.nombre;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([apellido, email, fechaRegistro, idTipoCuenta, nombre]);
}

UsuarioStruct createUsuarioStruct({
  String? apellido,
  String? email,
  DateTime? fechaRegistro,
  int? idTipoCuenta,
  String? nombre,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UsuarioStruct(
      apellido: apellido,
      email: email,
      fechaRegistro: fechaRegistro,
      idTipoCuenta: idTipoCuenta,
      nombre: nombre,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UsuarioStruct? updateUsuarioStruct(
  UsuarioStruct? usuario, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    usuario
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUsuarioStructData(
  Map<String, dynamic> firestoreData,
  UsuarioStruct? usuario,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (usuario == null) {
    return;
  }
  if (usuario.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && usuario.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final usuarioData = getUsuarioFirestoreData(usuario, forFieldValue);
  final nestedData = usuarioData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = usuario.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUsuarioFirestoreData(
  UsuarioStruct? usuario, [
  bool forFieldValue = false,
]) {
  if (usuario == null) {
    return {};
  }
  final firestoreData = mapToFirestore(usuario.toMap());

  // Add any Firestore field values
  usuario.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUsuarioListFirestoreData(
  List<UsuarioStruct>? usuarios,
) =>
    usuarios?.map((e) => getUsuarioFirestoreData(e, true)).toList() ?? [];
