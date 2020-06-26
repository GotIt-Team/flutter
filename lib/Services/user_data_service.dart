import 'package:gotit/enums/shared_preferences_enum.dart';
import 'package:gotit/models/user_model.dart';
import 'package:gotit/models/user_token_model.dart';
import 'package:gotit/services/shared_preferences_service.dart';
import 'dart:convert';

class UserData {
  static UserToken _user = UserToken();

  static Future<void> init() async {
    if(_user == null) { 
      _user = await SharedPreference.getData<UserToken>(key: SharedPreferenceKeys.user_data, mapper: (data) {
        if(data == null) return null;
        var result = json.decode(data);
        return UserToken.fromJson(result);
      });
    }
  }

  static User get user {
    return User(
      name: _user.name,
      address: _user.address,
      phoneNumber: _user.phoneNumber,
      picture: _user.picture
    );
  }

  static bool isLogged() {
    return _user != null && _user.token != null;
  }

  static String get token {
    return _user == null ? null : _user.token;
  }

  static void copyWith(User user, String token) {
    _user.name = user.name;
    _user.picture = user.picture;
    _user.phoneNumber = user.phoneNumber;
    _user.address = user.address;
    _user.token = token;
  }
}