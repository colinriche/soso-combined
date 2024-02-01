import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RetailersRecord extends FirestoreRecord {
  RetailersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "postcode" field.
  String? _postcode;
  String get postcode => _postcode ?? '';
  bool hasPostcode() => _postcode != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "industry" field.
  String? _industry;
  String get industry => _industry ?? '';
  bool hasIndustry() => _industry != null;

  // "store_id" field.
  int? _storeId;
  int get storeId => _storeId ?? 0;
  bool hasStoreId() => _storeId != null;

  // "store_name" field.
  String? _storeName;
  String get storeName => _storeName ?? '';
  bool hasStoreName() => _storeName != null;

  // "store_location" field.
  LatLng? _storeLocation;
  LatLng? get storeLocation => _storeLocation;
  bool hasStoreLocation() => _storeLocation != null;

  // "email_customer_services" field.
  String? _emailCustomerServices;
  String get emailCustomerServices => _emailCustomerServices ?? '';
  bool hasEmailCustomerServices() => _emailCustomerServices != null;

  // "email_complaints" field.
  String? _emailComplaints;
  String get emailComplaints => _emailComplaints ?? '';
  bool hasEmailComplaints() => _emailComplaints != null;

  // "email_dpo" field.
  String? _emailDpo;
  String get emailDpo => _emailDpo ?? '';
  bool hasEmailDpo() => _emailDpo != null;

  // "email_ceo" field.
  String? _emailCeo;
  String get emailCeo => _emailCeo ?? '';
  bool hasEmailCeo() => _emailCeo != null;

  // "email_legal" field.
  String? _emailLegal;
  String get emailLegal => _emailLegal ?? '';
  bool hasEmailLegal() => _emailLegal != null;

  // "email_press" field.
  String? _emailPress;
  String get emailPress => _emailPress ?? '';
  bool hasEmailPress() => _emailPress != null;

  // "store_email" field.
  String? _storeEmail;
  String get storeEmail => _storeEmail ?? '';
  bool hasStoreEmail() => _storeEmail != null;

  // "store_phone" field.
  String? _storePhone;
  String get storePhone => _storePhone ?? '';
  bool hasStorePhone() => _storePhone != null;

  // "added_by" field.
  DocumentReference? _addedBy;
  DocumentReference? get addedBy => _addedBy;
  bool hasAddedBy() => _addedBy != null;

  // "ceo_name" field.
  String? _ceoName;
  String get ceoName => _ceoName ?? '';
  bool hasCeoName() => _ceoName != null;

  // "contact_name" field.
  String? _contactName;
  String get contactName => _contactName ?? '';
  bool hasContactName() => _contactName != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _address = snapshotData['address'] as String?;
    _postcode = snapshotData['postcode'] as String?;
    _phone = snapshotData['phone'] as String?;
    _industry = snapshotData['industry'] as String?;
    _storeId = castToType<int>(snapshotData['store_id']);
    _storeName = snapshotData['store_name'] as String?;
    _storeLocation = snapshotData['store_location'] as LatLng?;
    _emailCustomerServices = snapshotData['email_customer_services'] as String?;
    _emailComplaints = snapshotData['email_complaints'] as String?;
    _emailDpo = snapshotData['email_dpo'] as String?;
    _emailCeo = snapshotData['email_ceo'] as String?;
    _emailLegal = snapshotData['email_legal'] as String?;
    _emailPress = snapshotData['email_press'] as String?;
    _storeEmail = snapshotData['store_email'] as String?;
    _storePhone = snapshotData['store_phone'] as String?;
    _addedBy = snapshotData['added_by'] as DocumentReference?;
    _ceoName = snapshotData['ceo_name'] as String?;
    _contactName = snapshotData['contact_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('retailers');

  static Stream<RetailersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RetailersRecord.fromSnapshot(s));

  static Future<RetailersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RetailersRecord.fromSnapshot(s));

  static RetailersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RetailersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RetailersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RetailersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RetailersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RetailersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRetailersRecordData({
  String? name,
  String? address,
  String? postcode,
  String? phone,
  String? industry,
  int? storeId,
  String? storeName,
  LatLng? storeLocation,
  String? emailCustomerServices,
  String? emailComplaints,
  String? emailDpo,
  String? emailCeo,
  String? emailLegal,
  String? emailPress,
  String? storeEmail,
  String? storePhone,
  DocumentReference? addedBy,
  String? ceoName,
  String? contactName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'address': address,
      'postcode': postcode,
      'phone': phone,
      'industry': industry,
      'store_id': storeId,
      'store_name': storeName,
      'store_location': storeLocation,
      'email_customer_services': emailCustomerServices,
      'email_complaints': emailComplaints,
      'email_dpo': emailDpo,
      'email_ceo': emailCeo,
      'email_legal': emailLegal,
      'email_press': emailPress,
      'store_email': storeEmail,
      'store_phone': storePhone,
      'added_by': addedBy,
      'ceo_name': ceoName,
      'contact_name': contactName,
    }.withoutNulls,
  );

  return firestoreData;
}

class RetailersRecordDocumentEquality implements Equality<RetailersRecord> {
  const RetailersRecordDocumentEquality();

  @override
  bool equals(RetailersRecord? e1, RetailersRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.address == e2?.address &&
        e1?.postcode == e2?.postcode &&
        e1?.phone == e2?.phone &&
        e1?.industry == e2?.industry &&
        e1?.storeId == e2?.storeId &&
        e1?.storeName == e2?.storeName &&
        e1?.storeLocation == e2?.storeLocation &&
        e1?.emailCustomerServices == e2?.emailCustomerServices &&
        e1?.emailComplaints == e2?.emailComplaints &&
        e1?.emailDpo == e2?.emailDpo &&
        e1?.emailCeo == e2?.emailCeo &&
        e1?.emailLegal == e2?.emailLegal &&
        e1?.emailPress == e2?.emailPress &&
        e1?.storeEmail == e2?.storeEmail &&
        e1?.storePhone == e2?.storePhone &&
        e1?.addedBy == e2?.addedBy &&
        e1?.ceoName == e2?.ceoName &&
        e1?.contactName == e2?.contactName;
  }

  @override
  int hash(RetailersRecord? e) => const ListEquality().hash([
        e?.name,
        e?.address,
        e?.postcode,
        e?.phone,
        e?.industry,
        e?.storeId,
        e?.storeName,
        e?.storeLocation,
        e?.emailCustomerServices,
        e?.emailComplaints,
        e?.emailDpo,
        e?.emailCeo,
        e?.emailLegal,
        e?.emailPress,
        e?.storeEmail,
        e?.storePhone,
        e?.addedBy,
        e?.ceoName,
        e?.contactName
      ]);

  @override
  bool isValidKey(Object? o) => o is RetailersRecord;
}
