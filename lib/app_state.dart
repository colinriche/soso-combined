import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _venue = prefs.getStringList('ff_venue') ?? _venue;
    });
    _safeInit(() {
      _checklist = prefs.getStringList('ff_checklist') ?? _checklist;
    });
    _safeInit(() {
      _blueBadge = prefs.getString('ff_blueBadge') ?? _blueBadge;
    });
    _safeInit(() {
      _pushNotify = prefs.getBool('ff_pushNotify') ?? _pushNotify;
    });
    _safeInit(() {
      _locationTracking =
          prefs.getBool('ff_locationTracking') ?? _locationTracking;
    });
    _safeInit(() {
      _blindCopyEmail = prefs.getBool('ff_blindCopyEmail') ?? _blindCopyEmail;
    });
    _safeInit(() {
      _speedoEnabled = prefs.getBool('ff_speedoEnabled') ?? _speedoEnabled;
    });
    _safeInit(() {
      _darkMode = prefs.getBool('ff_darkMode') ?? _darkMode;
    });
    _safeInit(() {
      _activeLicencePlate =
          prefs.getString('ff_activeLicencePlate') ?? _activeLicencePlate;
    });
    _safeInit(() {
      _memberRepeatCheck =
          prefs.getStringList('ff_memberRepeatCheck') ?? _memberRepeatCheck;
    });
    _safeInit(() {
      _licencePlate1 = prefs.getString('ff_licencePlate1') ?? _licencePlate1;
    });
    _safeInit(() {
      _licencePlate2 = prefs.getString('ff_licencePlate2') ?? _licencePlate2;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  LatLng? _singleLatLong = LatLng(55.953252, -3.188267);
  LatLng? get singleLatLong => _singleLatLong;
  set singleLatLong(LatLng? _value) {
    _singleLatLong = _value;
  }

  List<String> _venue = [];
  List<String> get venue => _venue;
  set venue(List<String> _value) {
    _venue = _value;
    prefs.setStringList('ff_venue', _value);
  }

  void addToVenue(String _value) {
    _venue.add(_value);
    prefs.setStringList('ff_venue', _venue);
  }

  void removeFromVenue(String _value) {
    _venue.remove(_value);
    prefs.setStringList('ff_venue', _venue);
  }

  void removeAtIndexFromVenue(int _index) {
    _venue.removeAt(_index);
    prefs.setStringList('ff_venue', _venue);
  }

  void updateVenueAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _venue[_index] = updateFn(_venue[_index]);
    prefs.setStringList('ff_venue', _venue);
  }

  void insertAtIndexInVenue(int _index, String _value) {
    _venue.insert(_index, _value);
    prefs.setStringList('ff_venue', _venue);
  }

  bool _locationSelect = false;
  bool get locationSelect => _locationSelect;
  set locationSelect(bool _value) {
    _locationSelect = _value;
  }

  List<String> _checklist = [];
  List<String> get checklist => _checklist;
  set checklist(List<String> _value) {
    _checklist = _value;
    prefs.setStringList('ff_checklist', _value);
  }

  void addToChecklist(String _value) {
    _checklist.add(_value);
    prefs.setStringList('ff_checklist', _checklist);
  }

  void removeFromChecklist(String _value) {
    _checklist.remove(_value);
    prefs.setStringList('ff_checklist', _checklist);
  }

  void removeAtIndexFromChecklist(int _index) {
    _checklist.removeAt(_index);
    prefs.setStringList('ff_checklist', _checklist);
  }

  void updateChecklistAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _checklist[_index] = updateFn(_checklist[_index]);
    prefs.setStringList('ff_checklist', _checklist);
  }

  void insertAtIndexInChecklist(int _index, String _value) {
    _checklist.insert(_index, _value);
    prefs.setStringList('ff_checklist', _checklist);
  }

  String _myEmail = '';
  String get myEmail => _myEmail;
  set myEmail(String _value) {
    _myEmail = _value;
  }

  String _blueBadge = '';
  String get blueBadge => _blueBadge;
  set blueBadge(String _value) {
    _blueBadge = _value;
    prefs.setString('ff_blueBadge', _value);
  }

  String _validatePhoto = '';
  String get validatePhoto => _validatePhoto;
  set validatePhoto(String _value) {
    _validatePhoto = _value;
  }

  List<int> _memberCheckRepeatINT = [];
  List<int> get memberCheckRepeatINT => _memberCheckRepeatINT;
  set memberCheckRepeatINT(List<int> _value) {
    _memberCheckRepeatINT = _value;
  }

  void addToMemberCheckRepeatINT(int _value) {
    _memberCheckRepeatINT.add(_value);
  }

  void removeFromMemberCheckRepeatINT(int _value) {
    _memberCheckRepeatINT.remove(_value);
  }

  void removeAtIndexFromMemberCheckRepeatINT(int _index) {
    _memberCheckRepeatINT.removeAt(_index);
  }

  void updateMemberCheckRepeatINTAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _memberCheckRepeatINT[_index] = updateFn(_memberCheckRepeatINT[_index]);
  }

  void insertAtIndexInMemberCheckRepeatINT(int _index, int _value) {
    _memberCheckRepeatINT.insert(_index, _value);
  }

  bool _pushNotify = false;
  bool get pushNotify => _pushNotify;
  set pushNotify(bool _value) {
    _pushNotify = _value;
    prefs.setBool('ff_pushNotify', _value);
  }

  bool _locationTracking = true;
  bool get locationTracking => _locationTracking;
  set locationTracking(bool _value) {
    _locationTracking = _value;
    prefs.setBool('ff_locationTracking', _value);
  }

  bool _blindCopyEmail = true;
  bool get blindCopyEmail => _blindCopyEmail;
  set blindCopyEmail(bool _value) {
    _blindCopyEmail = _value;
    prefs.setBool('ff_blindCopyEmail', _value);
  }

  bool _speedoEnabled = false;
  bool get speedoEnabled => _speedoEnabled;
  set speedoEnabled(bool _value) {
    _speedoEnabled = _value;
    prefs.setBool('ff_speedoEnabled', _value);
  }

  bool _darkMode = true;
  bool get darkMode => _darkMode;
  set darkMode(bool _value) {
    _darkMode = _value;
    prefs.setBool('ff_darkMode', _value);
  }

  String _activeLicencePlate = '';
  String get activeLicencePlate => _activeLicencePlate;
  set activeLicencePlate(String _value) {
    _activeLicencePlate = _value;
    prefs.setString('ff_activeLicencePlate', _value);
  }

  List<String> _memberRepeatCheck = [];
  List<String> get memberRepeatCheck => _memberRepeatCheck;
  set memberRepeatCheck(List<String> _value) {
    _memberRepeatCheck = _value;
    prefs.setStringList('ff_memberRepeatCheck', _value);
  }

  void addToMemberRepeatCheck(String _value) {
    _memberRepeatCheck.add(_value);
    prefs.setStringList('ff_memberRepeatCheck', _memberRepeatCheck);
  }

  void removeFromMemberRepeatCheck(String _value) {
    _memberRepeatCheck.remove(_value);
    prefs.setStringList('ff_memberRepeatCheck', _memberRepeatCheck);
  }

  void removeAtIndexFromMemberRepeatCheck(int _index) {
    _memberRepeatCheck.removeAt(_index);
    prefs.setStringList('ff_memberRepeatCheck', _memberRepeatCheck);
  }

  void updateMemberRepeatCheckAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _memberRepeatCheck[_index] = updateFn(_memberRepeatCheck[_index]);
    prefs.setStringList('ff_memberRepeatCheck', _memberRepeatCheck);
  }

  void insertAtIndexInMemberRepeatCheck(int _index, String _value) {
    _memberRepeatCheck.insert(_index, _value);
    prefs.setStringList('ff_memberRepeatCheck', _memberRepeatCheck);
  }

  String _licencePlate1 = '';
  String get licencePlate1 => _licencePlate1;
  set licencePlate1(String _value) {
    _licencePlate1 = _value;
    prefs.setString('ff_licencePlate1', _value);
  }

  String _licencePlate2 = '';
  String get licencePlate2 => _licencePlate2;
  set licencePlate2(String _value) {
    _licencePlate2 = _value;
    prefs.setString('ff_licencePlate2', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
