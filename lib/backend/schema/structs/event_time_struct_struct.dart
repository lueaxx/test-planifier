// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class EventTimeStructStruct extends FFFirebaseStruct {
  EventTimeStructStruct({
    DateTime? startTime,
    DateTime? endTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _startTime = startTime,
        _endTime = endTime,
        super(firestoreUtilData);

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  set startTime(DateTime? val) => _startTime = val;

  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  set endTime(DateTime? val) => _endTime = val;

  bool hasEndTime() => _endTime != null;

  static EventTimeStructStruct fromMap(Map<String, dynamic> data) =>
      EventTimeStructStruct(
        startTime: data['startTime'] as DateTime?,
        endTime: data['endTime'] as DateTime?,
      );

  static EventTimeStructStruct? maybeFromMap(dynamic data) => data is Map
      ? EventTimeStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'startTime': _startTime,
        'endTime': _endTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'startTime': serializeParam(
          _startTime,
          ParamType.DateTime,
        ),
        'endTime': serializeParam(
          _endTime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static EventTimeStructStruct fromSerializableMap(Map<String, dynamic> data) =>
      EventTimeStructStruct(
        startTime: deserializeParam(
          data['startTime'],
          ParamType.DateTime,
          false,
        ),
        endTime: deserializeParam(
          data['endTime'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'EventTimeStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EventTimeStructStruct &&
        startTime == other.startTime &&
        endTime == other.endTime;
  }

  @override
  int get hashCode => const ListEquality().hash([startTime, endTime]);
}

EventTimeStructStruct createEventTimeStructStruct({
  DateTime? startTime,
  DateTime? endTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EventTimeStructStruct(
      startTime: startTime,
      endTime: endTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EventTimeStructStruct? updateEventTimeStructStruct(
  EventTimeStructStruct? eventTimeStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    eventTimeStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEventTimeStructStructData(
  Map<String, dynamic> firestoreData,
  EventTimeStructStruct? eventTimeStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (eventTimeStruct == null) {
    return;
  }
  if (eventTimeStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && eventTimeStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final eventTimeStructData =
      getEventTimeStructFirestoreData(eventTimeStruct, forFieldValue);
  final nestedData =
      eventTimeStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = eventTimeStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEventTimeStructFirestoreData(
  EventTimeStructStruct? eventTimeStruct, [
  bool forFieldValue = false,
]) {
  if (eventTimeStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(eventTimeStruct.toMap());

  // Add any Firestore field values
  eventTimeStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEventTimeStructListFirestoreData(
  List<EventTimeStructStruct>? eventTimeStructs,
) =>
    eventTimeStructs
        ?.map((e) => getEventTimeStructFirestoreData(e, true))
        .toList() ??
    [];
