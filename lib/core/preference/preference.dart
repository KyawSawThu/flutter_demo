import 'dart:ffi';

import 'package:flutter_demo/core/extensions/stream_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  String _identifier;
  Future<SharedPreferences> _prefs;

  Preference._(this._identifier, this._prefs);

  factory Preference({
    required String identifier,
    required Future<SharedPreferences> prefs,
  }) {
    return Preference._(identifier, prefs);
  }

  String _identifiedKey(String key) {
    return "${_identifier}_$key";
  }
}

extension PreferenceStringExt on Preference {
  Future<bool> saveString(String key, String value) async {
    final prefs = await _prefs;
    return await prefs.setString(_identifiedKey(key), value);
  }

  Future<String?> stringValue(String key) async {
    final prefs = await _prefs;
    return prefs.getString(_identifiedKey(key));
  }
}

extension PreferenceIntExt on Preference {
  Future<bool> saveInt(String key, int value) async {
    final prefs = await _prefs;
    return await prefs.setInt(_identifiedKey(key), value);
  }

  Future<int?> intValue(String key) async {
    final prefs = await _prefs;
    return prefs.getInt(_identifiedKey(key));
  }
}

extension PreferenceDoubleExt on Preference {
  Future<bool> saveDouble(String key, double value) async {
    final prefs = await _prefs;
    return await prefs.setDouble(_identifiedKey(key), value);
  }

  Future<double?> doubleValue(String key) async {
    final prefs = await _prefs;
    return prefs.getDouble(_identifiedKey(key));
  }
}

extension PreferenceBoolExt on Preference {
  Future<bool> saveBool(String key, bool value) async {
    final prefs = await _prefs;
    return await prefs.setBool(_identifiedKey(key), value);
  }

  Future<bool?> boolValue(String key) async {
    final prefs = await _prefs;
    return prefs.getBool(_identifiedKey(key));
  }
}


