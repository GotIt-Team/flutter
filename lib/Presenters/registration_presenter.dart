
import 'package:gotit/enums/gender_enum.dart';
import 'package:gotit/helpers.dart';
import 'package:gotit/models/user_registration.dart';
import 'package:gotit/Services/http_service.dart';


class RegisterationPresenter {
  final UserRegistration userRegistration = UserRegistration();

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

  void setCity(String city) {
    userRegistration.city = city;
  }

  void setCountry(String country) {
    userRegistration.country = country;
  }

  void setGender(String gender) {
    userRegistration.gender = Helpers.getEnumFromString(Gender.values, gender);
  }

  //Valdiation Functions of form

  String validateName(String name) {
    if (name.isEmpty) {
      return "Please Enter Your Name";
    }
    return null;
  }

  String validateEmail(String email) {
    if (email.isEmpty) {
      return "Please Enter Your Correct Email";
    }
    return null;
  }

  String validatePassword(String password) {
    if (password.isEmpty || password.length < 8) {
      return "Please Enter at least 8 characters";
    }
    return null;
  }

  String validateRepeatePassword(String password) {
    if (password.isEmpty || password.length < 8) {
      return "The password not Identical!";
    }
    return null;
  }

  String validatePhone(String number) {
    if (number.isEmpty || number.length < 11) {
      return "Please Enter Correct phone number ! ";
    }
    return null;
  }

  String validateCity(String city) {
    if (city.isEmpty) {
      return "Please Enter Your city";
    }
    return null;
  }

  String validateCountry(String country) {
    if (country.isEmpty) {
      return "Please Enter Your Country";
    }
    return null;
  }

  String validateGender(String gender){
    if(gender.isEmpty){
      return "Please Enter male Or female";
    }
    return null;
  }

 registrationRequest()async{
   var result = await Http.send<bool>(
        endpointUrl: 'user/sign-up',
        method: "POST",
        body: userRegistration,
    );
      print(result.data);

  }
}