import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gotit/enums/shared_preferences_enum.dart';
import 'package:gotit/models/user_model.dart';
import 'package:gotit/models/result_model.dart';
import 'package:gotit/models/user_password_model.dart';
import 'package:gotit/services/http_service.dart';
import 'package:gotit/services/shared_preferences_service.dart';
import 'package:gotit/services/user_data_service.dart';
import 'package:gotit/views/widgets/progress_dialog.dart';

class UserSettingsPresenter {
  User user = UserData.user;
  UserPassword password = UserPassword();
  String theme , language;
  Result<bool> result;

  Future<void> _updateData() async {
    user.id = 0;
    result = await Http.send<bool>(
      endpointUrl: 'user/settings',
      method: "PUT",
      body: user,
    );

    if (result.isSucceeded) {
      SharedPreference.setString(key: SharedPreferenceKeys.user_data, value: json.encode(result.data));
      UserData.copyWith(user);
    }
  }

  Future<void> updateData(BuildContext context) async {
    await ProgressDialog.show(
        context: context,
        isCircular: false,
        method: () => _updateData()
    );
  }

  Future<void> _changePassword() async {
    result = await Http.send<bool>(
      endpointUrl: 'user/change-password',
      method: "PUT",
      body: password,
    );
  }

  Future<void> changePassword(BuildContext context) async {
    await ProgressDialog.show(
        context: context,
        isCircular: false,
        method: () => _changePassword()
    );
  }

  setImage(String image) {
    user.picture = image;
  }

  setName(String name){
    user.name = name;
  }

  setPhoneNumber(String phoneNumber){
    user.phoneNumber = phoneNumber;
  }

  setAddress(String address){
    user.address = address;
  }

  setOldPassword(String oldPassword){
    password.oldPassword = oldPassword;
  }

  setNewPassword(String newPassword){
    password.newPassword = newPassword;
  }

  setRepeatPassword(String repeatPassword){
    password.repeatedNewPassword = repeatPassword;
  }
}