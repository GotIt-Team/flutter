import 'package:flutter/material.dart';
import 'package:gotit/enums/shared_preferences_enum.dart';
import 'package:gotit/models/result_model.dart';
import 'package:gotit/models/user_login_model.dart';
import 'package:gotit/models/user_token_model.dart';
import 'package:gotit/services/http_service.dart';
import 'package:gotit/services/shared_preferences_service.dart';
import 'package:gotit/views/widgets/progress_dialog.dart';

class LoginPresenter {
  final UserLogin userLogin = UserLogin();
  Result<UserToken> result;

  Future<void> _login() async {
    result = await Http.send<UserToken>(
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
  }

  Future<void> login(BuildContext context) async {
    await ProgressDialog.show(
      context: context,
      isCircular: false,
      method: () => _login()
    );
  }

  // setter
  void setEmail(String email){
    userLogin.email = email;
  }
  void setPassword(String password){
    userLogin.password = password;
  }
}