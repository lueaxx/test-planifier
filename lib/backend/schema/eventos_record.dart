import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventosRecord extends FirestoreRecord {
  EventosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "event_name" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "event_date" field.
  DateTime? _eventDate;
  DateTime? get eventDate => _eventDate;
  bool hasEventDate() => _eventDate != null;

  // "encargado_name" field.
  String? _encargadoName;
  String get encargadoName => _encargadoName ?? '';
  bool hasEncargadoName() => _encargadoName != null;

  // "encargado_contacto" field.
  String? _encargadoContacto;
  String get encargadoContacto => _encargadoContacto ?? '';
  bool hasEncargadoContacto() => _encargadoContacto != null;

  // "direccion_ref" field.
  DocumentReference? _direccionRef;
  DocumentReference? get direccionRef => _direccionRef;
  bool hasDireccionRef() => _direccionRef != null;

  // "organization_ref" field.
  DocumentReference? _organizationRef;
  DocumentReference? get organizationRef => _organizationRef;
  bool hasOrganizationRef() => _organizationRef != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "invited_owners_emails" field.
  List<String>? _invitedOwnersEmails;
  List<String> get invitedOwnersEmails => _invitedOwnersEmails ?? const [];
  bool hasInvitedOwnersEmails() => _invitedOwnersEmails != null;

  // "event_type" field.
  String? _eventType;
  String get eventType => _eventType ?? '';
  bool hasEventType() => _eventType != null;

  // "start_time" field.
  String? _startTime;
  String get startTime => _startTime ?? '';
  bool hasStartTime() => _startTime != null;

  // "end_time" field.
  String? _endTime;
  String get endTime => _endTime ?? '';
  bool hasEndTime() => _endTime != null;

  // "access_code" field.
  String? _accessCode;
  String get accessCode => _accessCode ?? '';
  bool hasAccessCode() => _accessCode != null;

  void _initializeFields() {
    _eventName = snapshotData['event_name'] as String?;
    _eventDate = snapshotData['event_date'] as DateTime?;
    _encargadoName = snapshotData['encargado_name'] as String?;
    _encargadoContacto = snapshotData['encargado_contacto'] as String?;
    _direccionRef = snapshotData['direccion_ref'] as DocumentReference?;
    _organizationRef = snapshotData['organization_ref'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _invitedOwnersEmails = getDataList(snapshotData['invited_owners_emails']);
    _eventType = snapshotData['event_type'] as String?;
    _startTime = snapshotData['start_time'] as String?;
    _endTime = snapshotData['end_time'] as String?;
    _accessCode = snapshotData['access_code'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('eventos');

  static Stream<EventosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventosRecord.fromSnapshot(s));

  static Future<EventosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventosRecord.fromSnapshot(s));

  static EventosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventosRecordData({
  String? eventName,
  DateTime? eventDate,
  String? encargadoName,
  String? encargadoContacto,
  DocumentReference? direccionRef,
  DocumentReference? organizationRef,
  DateTime? createdTime,
  String? eventType,
  String? startTime,
  String? endTime,
  String? accessCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event_name': eventName,
      'event_date': eventDate,
      'encargado_name': encargadoName,
      'encargado_contacto': encargadoContacto,
      'direccion_ref': direccionRef,
      'organization_ref': organizationRef,
      'created_time': createdTime,
      'event_type': eventType,
      'start_time': startTime,
      'end_time': endTime,
      'access_code': accessCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventosRecordDocumentEquality implements Equality<EventosRecord> {
  const EventosRecordDocumentEquality();

  @override
  bool equals(EventosRecord? e1, EventosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.eventName == e2?.eventName &&
        e1?.eventDate == e2?.eventDate &&
        e1?.encargadoName == e2?.encargadoName &&
        e1?.encargadoContacto == e2?.encargadoContacto &&
        e1?.direccionRef == e2?.direccionRef &&
        e1?.organizationRef == e2?.organizationRef &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.invitedOwnersEmails, e2?.invitedOwnersEmails) &&
        e1?.eventType == e2?.eventType &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime &&
        e1?.accessCode == e2?.accessCode;
  }

  @override
  int hash(EventosRecord? e) => const ListEquality().hash([
        e?.eventName,
        e?.eventDate,
        e?.encargadoName,
        e?.encargadoContacto,
        e?.direccionRef,
        e?.organizationRef,
        e?.createdTime,
        e?.invitedOwnersEmails,
        e?.eventType,
        e?.startTime,
        e?.endTime,
        e?.accessCode
      ]);

  @override
  bool isValidKey(Object? o) => o is EventosRecord;
}
