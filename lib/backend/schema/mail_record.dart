import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MailRecord extends FirestoreRecord {
  MailRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "recipient" field.
  String? _recipient;
  String get recipient => _recipient ?? '';
  bool hasRecipient() => _recipient != null;

  // "to_email" field.
  String? _toEmail;
  String get toEmail => _toEmail ?? '';
  bool hasToEmail() => _toEmail != null;

  // "to_name" field.
  String? _toName;
  String get toName => _toName ?? '';
  bool hasToName() => _toName != null;

  // "from_name" field.
  String? _fromName;
  String get fromName => _fromName ?? '';
  bool hasFromName() => _fromName != null;

  // "cc_email" field.
  String? _ccEmail;
  String get ccEmail => _ccEmail ?? '';
  bool hasCcEmail() => _ccEmail != null;

  // "cc2_email" field.
  String? _cc2Email;
  String get cc2Email => _cc2Email ?? '';
  bool hasCc2Email() => _cc2Email != null;

  // "bcc_email" field.
  String? _bccEmail;
  String get bccEmail => _bccEmail ?? '';
  bool hasBccEmail() => _bccEmail != null;

  // "bcc2_email" field.
  String? _bcc2Email;
  String get bcc2Email => _bcc2Email ?? '';
  bool hasBcc2Email() => _bcc2Email != null;

  // "reply_to_email" field.
  String? _replyToEmail;
  String get replyToEmail => _replyToEmail ?? '';
  bool hasReplyToEmail() => _replyToEmail != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "operator" field.
  String? _operator;
  String get operator => _operator ?? '';
  bool hasOperator() => _operator != null;

  // "aka_name" field.
  String? _akaName;
  String get akaName => _akaName ?? '';
  bool hasAkaName() => _akaName != null;

  // "licence_plate" field.
  String? _licencePlate;
  String get licencePlate => _licencePlate ?? '';
  bool hasLicencePlate() => _licencePlate != null;

  // "location_info" field.
  String? _locationInfo;
  String get locationInfo => _locationInfo ?? '';
  bool hasLocationInfo() => _locationInfo != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "ata_info" field.
  String? _ataInfo;
  String get ataInfo => _ataInfo ?? '';
  bool hasAtaInfo() => _ataInfo != null;

  // "template_name" field.
  String? _templateName;
  String get templateName => _templateName ?? '';
  bool hasTemplateName() => _templateName != null;

  // "template_id" field.
  String? _templateId;
  String get templateId => _templateId ?? '';
  bool hasTemplateId() => _templateId != null;

  // "from" field.
  String? _from;
  String get from => _from ?? '';
  bool hasFrom() => _from != null;

  void _initializeFields() {
    _recipient = snapshotData['recipient'] as String?;
    _toEmail = snapshotData['to_email'] as String?;
    _toName = snapshotData['to_name'] as String?;
    _fromName = snapshotData['from_name'] as String?;
    _ccEmail = snapshotData['cc_email'] as String?;
    _cc2Email = snapshotData['cc2_email'] as String?;
    _bccEmail = snapshotData['bcc_email'] as String?;
    _bcc2Email = snapshotData['bcc2_email'] as String?;
    _replyToEmail = snapshotData['reply_to_email'] as String?;
    _subject = snapshotData['subject'] as String?;
    _message = snapshotData['message'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _operator = snapshotData['operator'] as String?;
    _akaName = snapshotData['aka_name'] as String?;
    _licencePlate = snapshotData['licence_plate'] as String?;
    _locationInfo = snapshotData['location_info'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _ataInfo = snapshotData['ata_info'] as String?;
    _templateName = snapshotData['template_name'] as String?;
    _templateId = snapshotData['template_id'] as String?;
    _from = snapshotData['from'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mail');

  static Stream<MailRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MailRecord.fromSnapshot(s));

  static Future<MailRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MailRecord.fromSnapshot(s));

  static MailRecord fromSnapshot(DocumentSnapshot snapshot) => MailRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MailRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MailRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MailRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MailRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMailRecordData({
  String? recipient,
  String? toEmail,
  String? toName,
  String? fromName,
  String? ccEmail,
  String? cc2Email,
  String? bccEmail,
  String? bcc2Email,
  String? replyToEmail,
  String? subject,
  String? message,
  DateTime? time,
  String? operator,
  String? akaName,
  String? licencePlate,
  String? locationInfo,
  LatLng? location,
  String? ataInfo,
  String? templateName,
  String? templateId,
  String? from,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'recipient': recipient,
      'to_email': toEmail,
      'to_name': toName,
      'from_name': fromName,
      'cc_email': ccEmail,
      'cc2_email': cc2Email,
      'bcc_email': bccEmail,
      'bcc2_email': bcc2Email,
      'reply_to_email': replyToEmail,
      'subject': subject,
      'message': message,
      'time': time,
      'operator': operator,
      'aka_name': akaName,
      'licence_plate': licencePlate,
      'location_info': locationInfo,
      'location': location,
      'ata_info': ataInfo,
      'template_name': templateName,
      'template_id': templateId,
      'from': from,
    }.withoutNulls,
  );

  return firestoreData;
}

class MailRecordDocumentEquality implements Equality<MailRecord> {
  const MailRecordDocumentEquality();

  @override
  bool equals(MailRecord? e1, MailRecord? e2) {
    return e1?.recipient == e2?.recipient &&
        e1?.toEmail == e2?.toEmail &&
        e1?.toName == e2?.toName &&
        e1?.fromName == e2?.fromName &&
        e1?.ccEmail == e2?.ccEmail &&
        e1?.cc2Email == e2?.cc2Email &&
        e1?.bccEmail == e2?.bccEmail &&
        e1?.bcc2Email == e2?.bcc2Email &&
        e1?.replyToEmail == e2?.replyToEmail &&
        e1?.subject == e2?.subject &&
        e1?.message == e2?.message &&
        e1?.time == e2?.time &&
        e1?.operator == e2?.operator &&
        e1?.akaName == e2?.akaName &&
        e1?.licencePlate == e2?.licencePlate &&
        e1?.locationInfo == e2?.locationInfo &&
        e1?.location == e2?.location &&
        e1?.ataInfo == e2?.ataInfo &&
        e1?.templateName == e2?.templateName &&
        e1?.templateId == e2?.templateId &&
        e1?.from == e2?.from;
  }

  @override
  int hash(MailRecord? e) => const ListEquality().hash([
        e?.recipient,
        e?.toEmail,
        e?.toName,
        e?.fromName,
        e?.ccEmail,
        e?.cc2Email,
        e?.bccEmail,
        e?.bcc2Email,
        e?.replyToEmail,
        e?.subject,
        e?.message,
        e?.time,
        e?.operator,
        e?.akaName,
        e?.licencePlate,
        e?.locationInfo,
        e?.location,
        e?.ataInfo,
        e?.templateName,
        e?.templateId,
        e?.from
      ]);

  @override
  bool isValidKey(Object? o) => o is MailRecord;
}
