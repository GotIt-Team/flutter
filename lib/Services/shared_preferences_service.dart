import 'package:flutter/cupertino.dart';
import 'package:gotit/enums/shared_preferences_enum.dart';
import 'package:gotit/helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference{
  static SharedPreferences _prefs;

  static Future<void> _init() async {
    if(_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  static Future<T> getData<T>({@required SharedPreferenceKeys key, dynamic Function(dynamic) mapper}) async {
    await _init();
    var data = _prefs.get(Helpers.getStringFromEnum(key));
    if(mapper != null) {
      return mapper(data);
    }
    return data;
  }

  static Future<bool> setInt({@required SharedPreferenceKeys key, @required int value}) async{
    await _init();
    return await _prefs.setInt(Helpers.getStringFromEnum(key), value);
  }

  static Future<bool> setDouble({@required SharedPreferenceKeys key, @required double value}) async{
    await _init();
    return await _prefs.setDouble(Helpers.getStringFromEnum(key), value);
  }
  
  static Future<bool> setBool({@required SharedPreferenceKeys key, @required bool value}) async{
    await _init();
    return await _prefs.setBool(Helpers.getStringFromEnum(key), value);
  }
  
  static Future<bool> setString({@required SharedPreferenceKeys key, @required String value}) async{
    await _init();
    return await _prefs.setString(Helpers.getStringFromEnum(key), value);
  }

  static Future<bool> setStringList({@required SharedPreferenceKeys key, @required List<String> values}) async{
    await _init();
    return await _prefs.setStringList(Helpers.getStringFromEnum(key), values);
  }
}