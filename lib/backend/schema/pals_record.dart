import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PalsRecord extends FirestoreRecord {
  PalsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "hospital" field.
  String? _hospital;
  String get hospital => _hospital ?? '';
  bool hasHospital() => _hospital != null;

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

  // "sms_text" field.
  String? _smsText;
  String get smsText => _smsText ?? '';
  bool hasSmsText() => _smsText != null;

  // "latlang" field.
  LatLng? _latlang;
  LatLng? get latlang => _latlang;
  bool hasLatlang() => _latlang != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "visiting_hours" field.
  String? _visitingHours;
  String get visitingHours => _visitingHours ?? '';
  bool hasVisitingHours() => _visitingHours != null;

  // "hospital_location" field.
  String? _hospitalLocation;
  String get hospitalLocation => _hospitalLocation ?? '';
  bool hasHospitalLocation() => _hospitalLocation != null;

  // "visitor_info" field.
  String? _visitorInfo;
  String get visitorInfo => _visitorInfo ?? '';
  bool hasVisitorInfo() => _visitorInfo != null;

  // "car_park_info" field.
  String? _carParkInfo;
  String get carParkInfo => _carParkInfo ?? '';
  bool hasCarParkInfo() => _carParkInfo != null;

  // "pals_car_park" field.
  String? _palsCarPark;
  String get palsCarPark => _palsCarPark ?? '';
  bool hasPalsCarPark() => _palsCarPark != null;

  void _initializeFields() {
    _hospital = snapshotData['hospital'] as String?;
    _address = snapshotData['address'] as String?;
    _postcode = snapshotData['postcode'] as String?;
    _phone = snapshotData['phone'] as String?;
    _smsText = snapshotData['sms_text'] as String?;
    _latlang = snapshotData['latlang'] as LatLng?;
    _email = snapshotData['email'] as String?;
    _url = snapshotData['url'] as String?;
    _photo = snapshotData['photo'] as String?;
    _visitingHours = snapshotData['visiting_hours'] as String?;
    _hospitalLocation = snapshotData['hospital_location'] as String?;
    _visitorInfo = snapshotData['visitor_info'] as String?;
    _carParkInfo = snapshotData['car_park_info'] as String?;
    _palsCarPark = snapshotData['pals_car_park'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pals');

  static Stream<PalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PalsRecord.fromSnapshot(s));

  static Future<PalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PalsRecord.fromSnapshot(s));

  static PalsRecord fromSnapshot(DocumentSnapshot snapshot) => PalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PalsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PalsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPalsRecordData({
  String? hospital,
  String? address,
  String? postcode,
  String? phone,
  String? smsText,
  LatLng? latlang,
  String? email,
  String? url,
  String? photo,
  String? visitingHours,
  String? hospitalLocation,
  String? visitorInfo,
  String? carParkInfo,
  String? palsCarPark,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'hospital': hospital,
      'address': address,
      'postcode': postcode,
      'phone': phone,
      'sms_text': smsText,
      'latlang': latlang,
      'email': email,
      'url': url,
      'photo': photo,
      'visiting_hours': visitingHours,
      'hospital_location': hospitalLocation,
      'visitor_info': visitorInfo,
      'car_park_info': carParkInfo,
      'pals_car_park': palsCarPark,
    }.withoutNulls,
  );

  return firestoreData;
}

class PalsRecordDocumentEquality implements Equality<PalsRecord> {
  const PalsRecordDocumentEquality();

  @override
  bool equals(PalsRecord? e1, PalsRecord? e2) {
    return e1?.hospital == e2?.hospital &&
        e1?.address == e2?.address &&
        e1?.postcode == e2?.postcode &&
        e1?.phone == e2?.phone &&
        e1?.smsText == e2?.smsText &&
        e1?.latlang == e2?.latlang &&
        e1?.email == e2?.email &&
        e1?.url == e2?.url &&
        e1?.photo == e2?.photo &&
        e1?.visitingHours == e2?.visitingHours &&
        e1?.hospitalLocation == e2?.hospitalLocation &&
        e1?.visitorInfo == e2?.visitorInfo &&
        e1?.carParkInfo == e2?.carParkInfo &&
        e1?.palsCarPark == e2?.palsCarPark;
  }

  @override
  int hash(PalsRecord? e) => const ListEquality().hash([
        e?.hospital,
        e?.address,
        e?.postcode,
        e?.phone,
        e?.smsText,
        e?.latlang,
        e?.email,
        e?.url,
        e?.photo,
        e?.visitingHours,
        e?.hospitalLocation,
        e?.visitorInfo,
        e?.carParkInfo,
        e?.palsCarPark
      ]);

  @override
  bool isValidKey(Object? o) => o is PalsRecord;
}
