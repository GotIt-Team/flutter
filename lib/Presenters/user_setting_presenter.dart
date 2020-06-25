import 'package:flutter/material.dart';
import 'package:gotit/Models/user_model.dart';
import 'package:gotit/models/result_model.dart';
import 'package:gotit/Services/http_service.dart';
import 'package:gotit/views/widgets/progress_dialog.dart';
import 'package:gotit/enums/shared_preferences_enum.dart';
import 'package:gotit/services/shared_preferences_service.dart';

class UserSettingPresenter {
  User userSetting ;
  String theme , language ;
  Result<bool> result;

  Future<void> _updateData() async {

    result = await Http.send<bool>(
      endpointUrl: '',
      method: "POST",
      body: userSetting,
    );

    if(result.isSucceeded) {
      SharedPreference.setString(key: SharedPreferenceKeys.isDark, value: theme);
      SharedPreference.setString(key: SharedPreferenceKeys.lang, value:language);
    }
  }

  Future<void> updateData(BuildContext context) async {
    await ProgressDialog.show(
        context: context,
        isCircular: false,
        method: () => _updateData()
    );
  }

  setName(String name){
    userSetting.name=name;
  }

  setPhoneNumber(String phoneNumber){
    userSetting.phoneNumber=phoneNumber;
  }

  setAddress(String address){
    userSetting.address=address;
  }

  setOldPassword(String oldPassword){
    userSetting.oldPassword=oldPassword;
  }

  setNewPassword(String newPassword){
    userSetting.newPassword=newPassword;
  }

  setRepeatPassword(String repeatPassword){
    userSetting.repeatPassword=repeatPassword;
  }

  setTheme (String appTheme){
    theme = appTheme;
  }

  setLanguage(String appLanguage){
    language = appLanguage;
}

}