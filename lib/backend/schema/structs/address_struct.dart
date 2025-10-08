// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AddressStruct extends FFFirebaseStruct {
  AddressStruct({
    DocumentReference? owner,
    bool? defaultAddress,
    DateTime? createdAt,
    String? alias,
    String? calle,
    int? altura,
    String? piso,
    String? dpto,
    String? codigoPostal,
    String? localidad,
    String? provincia,
    String? entreCalles,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _owner = owner,
        _defaultAddress = defaultAddress,
        _createdAt = createdAt,
        _alias = alias,
        _calle = calle,
        _altura = altura,
        _piso = piso,
        _dpto = dpto,
        _codigoPostal = codigoPostal,
        _localidad = localidad,
        _provincia = provincia,
        _entreCalles = entreCalles,
        super(firestoreUtilData);

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  set owner(DocumentReference? val) => _owner = val;

  bool hasOwner() => _owner != null;

  // "default_address" field.
  bool? _defaultAddress;
  bool get defaultAddress => _defaultAddress ?? false;
  set defaultAddress(bool? val) => _defaultAddress = val;

  bool hasDefaultAddress() => _defaultAddress != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "alias" field.
  String? _alias;
  String get alias => _alias ?? '';
  set alias(String? val) => _alias = val;

  bool hasAlias() => _alias != null;

  // "calle" field.
  String? _calle;
  String get calle => _calle ?? '';
  set calle(String? val) => _calle = val;

  bool hasCalle() => _calle != null;

  // "altura" field.
  int? _altura;
  int get altura => _altura ?? 0;
  set altura(int? val) => _altura = val;

  void incrementAltura(int amount) => altura = altura + amount;

  bool hasAltura() => _altura != null;

  // "piso" field.
  String? _piso;
  String get piso => _piso ?? '';
  set piso(String? val) => _piso = val;

  bool hasPiso() => _piso != null;

  // "dpto" field.
  String? _dpto;
  String get dpto => _dpto ?? '';
  set dpto(String? val) => _dpto = val;

  bool hasDpto() => _dpto != null;

  // "codigo_postal" field.
  String? _codigoPostal;
  String get codigoPostal => _codigoPostal ?? '';
  set codigoPostal(String? val) => _codigoPostal = val;

  bool hasCodigoPostal() => _codigoPostal != null;

  // "localidad" field.
  String? _localidad;
  String get localidad => _localidad ?? '';
  set localidad(String? val) => _localidad = val;

  bool hasLocalidad() => _localidad != null;

  // "provincia" field.
  String? _provincia;
  String get provincia => _provincia ?? '';
  set provincia(String? val) => _provincia = val;

  bool hasProvincia() => _provincia != null;

  // "entre_calles" field.
  String? _entreCalles;
  String get entreCalles => _entreCalles ?? '';
  set entreCalles(String? val) => _entreCalles = val;

  bool hasEntreCalles() => _entreCalles != null;

  static AddressStruct fromMap(Map<String, dynamic> data) => AddressStruct(
        owner: data['owner'] as DocumentReference?,
        defaultAddress: data['default_address'] as bool?,
        createdAt: data['created_at'] as DateTime?,
        alias: data['alias'] as String?,
        calle: data['calle'] as String?,
        altura: castToType<int>(data['altura']),
        piso: data['piso'] as String?,
        dpto: data['dpto'] as String?,
        codigoPostal: data['codigo_postal'] as String?,
        localidad: data['localidad'] as String?,
        provincia: data['provincia'] as String?,
        entreCalles: data['entre_calles'] as String?,
      );

  static AddressStruct? maybeFromMap(dynamic data) =>
      data is Map ? AddressStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'owner': _owner,
        'default_address': _defaultAddress,
        'created_at': _createdAt,
        'alias': _alias,
        'calle': _calle,
        'altura': _altura,
        'piso': _piso,
        'dpto': _dpto,
        'codigo_postal': _codigoPostal,
        'localidad': _localidad,
        'provincia': _provincia,
        'entre_calles': _entreCalles,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'owner': serializeParam(
          _owner,
          ParamType.DocumentReference,
        ),
        'default_address': serializeParam(
          _defaultAddress,
          ParamType.bool,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'alias': serializeParam(
          _alias,
          ParamType.String,
        ),
        'calle': serializeParam(
          _calle,
          ParamType.String,
        ),
        'altura': serializeParam(
          _altura,
          ParamType.int,
        ),
        'piso': serializeParam(
          _piso,
          ParamType.String,
        ),
        'dpto': serializeParam(
          _dpto,
          ParamType.String,
        ),
        'codigo_postal': serializeParam(
          _codigoPostal,
          ParamType.String,
        ),
        'localidad': serializeParam(
          _localidad,
          ParamType.String,
        ),
        'provincia': serializeParam(
          _provincia,
          ParamType.String,
        ),
        'entre_calles': serializeParam(
          _entreCalles,
          ParamType.String,
        ),
      }.withoutNulls;

  static AddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddressStruct(
        owner: deserializeParam(
          data['owner'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Usuario'],
        ),
        defaultAddress: deserializeParam(
          data['default_address'],
          ParamType.bool,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        alias: deserializeParam(
          data['alias'],
          ParamType.String,
          false,
        ),
        calle: deserializeParam(
          data['calle'],
          ParamType.String,
          false,
        ),
        altura: deserializeParam(
          data['altura'],
          ParamType.int,
          false,
        ),
        piso: deserializeParam(
          data['piso'],
          ParamType.String,
          false,
        ),
        dpto: deserializeParam(
          data['dpto'],
          ParamType.String,
          false,
        ),
        codigoPostal: deserializeParam(
          data['codigo_postal'],
          ParamType.String,
          false,
        ),
        localidad: deserializeParam(
          data['localidad'],
          ParamType.String,
          false,
        ),
        provincia: deserializeParam(
          data['provincia'],
          ParamType.String,
          false,
        ),
        entreCalles: deserializeParam(
          data['entre_calles'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddressStruct &&
        owner == other.owner &&
        defaultAddress == other.defaultAddress &&
        createdAt == other.createdAt &&
        alias == other.alias &&
        calle == other.calle &&
        altura == other.altura &&
        piso == other.piso &&
        dpto == other.dpto &&
        codigoPostal == other.codigoPostal &&
        localidad == other.localidad &&
        provincia == other.provincia &&
        entreCalles == other.entreCalles;
  }

  @override
  int get hashCode => const ListEquality().hash([
        owner,
        defaultAddress,
        createdAt,
        alias,
        calle,
        altura,
        piso,
        dpto,
        codigoPostal,
        localidad,
        provincia,
        entreCalles
      ]);
}

AddressStruct createAddressStruct({
  DocumentReference? owner,
  bool? defaultAddress,
  DateTime? createdAt,
  String? alias,
  String? calle,
  int? altura,
  String? piso,
  String? dpto,
  String? codigoPostal,
  String? localidad,
  String? provincia,
  String? entreCalles,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddressStruct(
      owner: owner,
      defaultAddress: defaultAddress,
      createdAt: createdAt,
      alias: alias,
      calle: calle,
      altura: altura,
      piso: piso,
      dpto: dpto,
      codigoPostal: codigoPostal,
      localidad: localidad,
      provincia: provincia,
      entreCalles: entreCalles,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AddressStruct? updateAddressStruct(
  AddressStruct? address, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    address
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAddressStructData(
  Map<String, dynamic> firestoreData,
  AddressStruct? address,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (address == null) {
    return;
  }
  if (address.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && address.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addressData = getAddressFirestoreData(address, forFieldValue);
  final nestedData = addressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = address.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAddressFirestoreData(
  AddressStruct? address, [
  bool forFieldValue = false,
]) {
  if (address == null) {
    return {};
  }
  final firestoreData = mapToFirestore(address.toMap());

  // Add any Firestore field values
  address.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddressListFirestoreData(
  List<AddressStruct>? addresss,
) =>
    addresss?.map((e) => getAddressFirestoreData(e, true)).toList() ?? [];
