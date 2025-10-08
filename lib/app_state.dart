import 'package:flutter/material.dart';
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
      _misEventosRefs = prefs
              .getStringList('ff_misEventosRefs')
              ?.map((path) => path.ref)
              .toList() ??
          _misEventosRefs;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<DocumentReference> _misEventosRefs = [];
  List<DocumentReference> get misEventosRefs => _misEventosRefs;
  set misEventosRefs(List<DocumentReference> value) {
    _misEventosRefs = value;
    prefs.setStringList('ff_misEventosRefs', value.map((x) => x.path).toList());
  }

  void addToMisEventosRefs(DocumentReference value) {
    misEventosRefs.add(value);
    prefs.setStringList(
        'ff_misEventosRefs', _misEventosRefs.map((x) => x.path).toList());
  }

  void removeFromMisEventosRefs(DocumentReference value) {
    misEventosRefs.remove(value);
    prefs.setStringList(
        'ff_misEventosRefs', _misEventosRefs.map((x) => x.path).toList());
  }

  void removeAtIndexFromMisEventosRefs(int index) {
    misEventosRefs.removeAt(index);
    prefs.setStringList(
        'ff_misEventosRefs', _misEventosRefs.map((x) => x.path).toList());
  }

  void updateMisEventosRefsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    misEventosRefs[index] = updateFn(_misEventosRefs[index]);
    prefs.setStringList(
        'ff_misEventosRefs', _misEventosRefs.map((x) => x.path).toList());
  }

  void insertAtIndexInMisEventosRefs(int index, DocumentReference value) {
    misEventosRefs.insert(index, value);
    prefs.setStringList(
        'ff_misEventosRefs', _misEventosRefs.map((x) => x.path).toList());
  }

  List<String> _tempOwnersEmails = [];
  List<String> get tempOwnersEmails => _tempOwnersEmails;
  set tempOwnersEmails(List<String> value) {
    _tempOwnersEmails = value;
  }

  void addToTempOwnersEmails(String value) {
    tempOwnersEmails.add(value);
  }

  void removeFromTempOwnersEmails(String value) {
    tempOwnersEmails.remove(value);
  }

  void removeAtIndexFromTempOwnersEmails(int index) {
    tempOwnersEmails.removeAt(index);
  }

  void updateTempOwnersEmailsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    tempOwnersEmails[index] = updateFn(_tempOwnersEmails[index]);
  }

  void insertAtIndexInTempOwnersEmails(int index, String value) {
    tempOwnersEmails.insert(index, value);
  }
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
