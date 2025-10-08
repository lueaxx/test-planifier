import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParticipantesRecord extends FirestoreRecord {
  ParticipantesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "added_at" field.
  DateTime? _addedAt;
  DateTime? get addedAt => _addedAt;
  bool hasAddedAt() => _addedAt != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _addedAt = snapshotData['added_at'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _role = snapshotData['role'] as String?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('participantes')
          : FirebaseFirestore.instance.collectionGroup('participantes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('participantes').doc(id);

  static Stream<ParticipantesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ParticipantesRecord.fromSnapshot(s));

  static Future<ParticipantesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ParticipantesRecord.fromSnapshot(s));

  static ParticipantesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ParticipantesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ParticipantesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ParticipantesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ParticipantesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ParticipantesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createParticipantesRecordData({
  DocumentReference? userRef,
  DateTime? addedAt,
  String? status,
  String? role,
  String? email,
  String? displayName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_ref': userRef,
      'added_at': addedAt,
      'status': status,
      'role': role,
      'email': email,
      'display_name': displayName,
    }.withoutNulls,
  );

  return firestoreData;
}

class ParticipantesRecordDocumentEquality
    implements Equality<ParticipantesRecord> {
  const ParticipantesRecordDocumentEquality();

  @override
  bool equals(ParticipantesRecord? e1, ParticipantesRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.addedAt == e2?.addedAt &&
        e1?.status == e2?.status &&
        e1?.role == e2?.role &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName;
  }

  @override
  int hash(ParticipantesRecord? e) => const ListEquality().hash(
      [e?.userRef, e?.addedAt, e?.status, e?.role, e?.email, e?.displayName]);

  @override
  bool isValidKey(Object? o) => o is ParticipantesRecord;
}
