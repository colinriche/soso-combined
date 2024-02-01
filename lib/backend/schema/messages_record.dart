import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_by" field.
  DateTime? _createdBy;
  DateTime? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "recipient" field.
  String? _recipient;
  String get recipient => _recipient ?? '';
  bool hasRecipient() => _recipient != null;

  // "latlang" field.
  LatLng? _latlang;
  LatLng? get latlang => _latlang;
  bool hasLatlang() => _latlang != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "with_gps" field.
  bool? _withGps;
  bool get withGps => _withGps ?? false;
  bool hasWithGps() => _withGps != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "outgoing_message" field.
  bool? _outgoingMessage;
  bool get outgoingMessage => _outgoingMessage ?? false;
  bool hasOutgoingMessage() => _outgoingMessage != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "myEmail" field.
  String? _myEmail;
  String get myEmail => _myEmail ?? '';
  bool hasMyEmail() => _myEmail != null;

  // "licence_plate" field.
  String? _licencePlate;
  String get licencePlate => _licencePlate ?? '';
  bool hasLicencePlate() => _licencePlate != null;

  // "ata" field.
  String? _ata;
  String get ata => _ata ?? '';
  bool hasAta() => _ata != null;

  // "operator" field.
  String? _operator;
  String get operator => _operator ?? '';
  bool hasOperator() => _operator != null;

  // "message_actual" field.
  String? _messageActual;
  String get messageActual => _messageActual ?? '';
  bool hasMessageActual() => _messageActual != null;

  // "operator_email" field.
  String? _operatorEmail;
  String get operatorEmail => _operatorEmail ?? '';
  bool hasOperatorEmail() => _operatorEmail != null;

  // "current_location" field.
  bool? _currentLocation;
  bool get currentLocation => _currentLocation ?? false;
  bool hasCurrentLocation() => _currentLocation != null;

  void _initializeFields() {
    _createdBy = snapshotData['created_by'] as DateTime?;
    _recipient = snapshotData['recipient'] as String?;
    _latlang = snapshotData['latlang'] as LatLng?;
    _message = snapshotData['message'] as String?;
    _withGps = snapshotData['with_gps'] as bool?;
    _address = snapshotData['address'] as String?;
    _outgoingMessage = snapshotData['outgoing_message'] as bool?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _myEmail = snapshotData['myEmail'] as String?;
    _licencePlate = snapshotData['licence_plate'] as String?;
    _ata = snapshotData['ata'] as String?;
    _operator = snapshotData['operator'] as String?;
    _messageActual = snapshotData['message_actual'] as String?;
    _operatorEmail = snapshotData['operator_email'] as String?;
    _currentLocation = snapshotData['current_location'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('messages');

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  DateTime? createdBy,
  String? recipient,
  LatLng? latlang,
  String? message,
  bool? withGps,
  String? address,
  bool? outgoingMessage,
  DocumentReference? userRef,
  String? myEmail,
  String? licencePlate,
  String? ata,
  String? operator,
  String? messageActual,
  String? operatorEmail,
  bool? currentLocation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_by': createdBy,
      'recipient': recipient,
      'latlang': latlang,
      'message': message,
      'with_gps': withGps,
      'address': address,
      'outgoing_message': outgoingMessage,
      'user_ref': userRef,
      'myEmail': myEmail,
      'licence_plate': licencePlate,
      'ata': ata,
      'operator': operator,
      'message_actual': messageActual,
      'operator_email': operatorEmail,
      'current_location': currentLocation,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    return e1?.createdBy == e2?.createdBy &&
        e1?.recipient == e2?.recipient &&
        e1?.latlang == e2?.latlang &&
        e1?.message == e2?.message &&
        e1?.withGps == e2?.withGps &&
        e1?.address == e2?.address &&
        e1?.outgoingMessage == e2?.outgoingMessage &&
        e1?.userRef == e2?.userRef &&
        e1?.myEmail == e2?.myEmail &&
        e1?.licencePlate == e2?.licencePlate &&
        e1?.ata == e2?.ata &&
        e1?.operator == e2?.operator &&
        e1?.messageActual == e2?.messageActual &&
        e1?.operatorEmail == e2?.operatorEmail &&
        e1?.currentLocation == e2?.currentLocation;
  }

  @override
  int hash(MessagesRecord? e) => const ListEquality().hash([
        e?.createdBy,
        e?.recipient,
        e?.latlang,
        e?.message,
        e?.withGps,
        e?.address,
        e?.outgoingMessage,
        e?.userRef,
        e?.myEmail,
        e?.licencePlate,
        e?.ata,
        e?.operator,
        e?.messageActual,
        e?.operatorEmail,
        e?.currentLocation
      ]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}
