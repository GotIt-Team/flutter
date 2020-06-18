import 'package:gotit/Models/user_login_model.dart';
import 'package:gotit/enums/shared_preferences_enum.dart';
import 'package:gotit/models/result_model.dart';
import 'package:gotit/models/user_token_model.dart';
import 'package:gotit/services/http_service.dart';
import 'package:gotit/services/shared_preferences_service.dart';

class LoginPresenter {
  final UserLogin userLogin = UserLogin();
  String message;

  Future<Result<UserToken>> login() async {
    var result = await Http.send<UserToken>(
      endpointUrl: 'user/sign-in',
      method: 'POST',
      body: userLogin,
      mapper: (data) => UserToken.fromJson(data),
    );

    if(result.isSucceeded) {
      SharedPreference.setString(key: SharedPreferenceKeys.user_token, value: result.data.token);
      SharedPreference.setString(key: SharedPreferenceKeys.user_name, value: result.data.name);
      SharedPreference.setString(key: SharedPreferenceKeys.user_picture, value: result.data.picture);
    }
    
    return result;
  }

  // setter
  void setEmail(String email){
    userLogin.email = email;
  }
  void setPassword(String password){
    userLogin.password = password;
  }

  String validateEmail(String email){
    if(email.isEmpty){
      return "Please Enter Your Email";
    }
    return null;
  }
  String validatePassword(String password){
    if(password.isEmpty){
      return "Please Enter Your password";
    }
    return null;
  }
}