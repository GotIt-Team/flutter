import 'package:gotit/enums/shared_preferences_enum.dart';
import 'package:gotit/models/user_model.dart';
import 'package:gotit/services/shared_preferences_service.dart';
import 'dart:convert';

class UserData {
  static User _user;

  static Future<void> init() async {
    if(_user == null) { 
      _user = await SharedPreference.getData<User>(key: SharedPreferenceKeys.user_data, mapper: (data) {
        if(data == null) return User();
        var result = json.decode(data);
        return User.fromJson(result);
      });
    }
  }

  static User get user {
    return _user;
  }

  static bool isLogged() {
    return _user != null && _user.token != null;
  }

  static String get token {
    return _user == null ? null : _user.token;
  }

  static void copyWith(User user) {
    _user.id = user.id;
    _user.name = user.name;
    _user.picture = user.picture;
    _user.phoneNumber = user.phoneNumber;
    _user.address = user.address;
    _user.token = user.token;
    _user.type = user.type;
  }
}