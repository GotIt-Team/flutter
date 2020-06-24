
import 'package:flutter/material.dart';
import 'package:gotit/enums/gender_enum.dart';
import 'package:gotit/enums/user_type_enum.dart';
import 'package:gotit/helpers.dart';
import 'package:gotit/models/result_model.dart';
import 'package:gotit/models/user_registration.dart';
import 'package:gotit/Services/http_service.dart';
import 'package:gotit/views/widgets/progress_dialog.dart';


class RegisterationPresenter {
  final UserRegistration userRegistration = UserRegistration();
  String gender;
  Result<bool> result;

  void setName(String name) {
    userRegistration.name = name;
  }

  void setEmail(String email) {
    userRegistration.email = email;
  }

  void setPassword(String password) {
    userRegistration.password = password;
  }

  void setRepeatePassword(String password) {
    userRegistration.repeatPassword = password;
  }

  void setPhoneNumber(String phoneNumber) {
    userRegistration.phoneNumber = phoneNumber;
  }

  void setAddress(String address) {
    userRegistration.address = address;
  }

  void setGender(String gender) {
    userRegistration.gender = Helpers.getEnumFromString(Gender.values, gender);
  }

  Future<void> _registration() async {
    userRegistration.type = UserType.regular;
    result = await Http.send<bool>(
      endpointUrl: 'user/sign-up',
      method: "POST",
      body: userRegistration,
    );
  }

  Future<void> registration(BuildContext context) async {
    await ProgressDialog.show(
      context: context,
      isCircular: false,
      method: () => _registration()
    );
  }
}