class Validator {
  static String _required = 'This field is required';
  static String _number = 'This field value must be numeric';
  static String _email = 'The email is\'t valid';
  static String _phone = 'The phone number is\'t valid';
  static String _strongPassword = 'The password must be at least 8 digits and contains only [a-z, A-Z, 1-9]';
  static String _matchPassword = 'Password does not match';
  static String _notMoreThan32 = 'The value can\'t be more than 32 digit';
  static String _password;
  
  static String requiredField(String value){
    if(value == null || value.isEmpty) {
      return _required;
    }
    return null;
  }

  static String numberField(String value){
    if(value.isEmpty) {
      return _required;
    }
    if(!RegExp(r"^[0-9]+$").hasMatch(value)) {
      return _number;
    }

    return null;
  }

  static String emailField(String value){
    if(value.isEmpty) {
      return _required;
    }
    if(!RegExp(r"^[^\s@]+@[^\s@]+\.[^\s@]+$").hasMatch(value)) {
      return _email;
    }

    return null;
  }

  static String phoneField(String value){
    if(value.isEmpty) {
      return _required;
    }
    if(!RegExp(r"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$").hasMatch(value)) {
      return _phone;
    }

    return null;
  }

  static String passwordField(String value){
    _password = value;
    if(value.isEmpty) {
      return _required;
    }
    if(!RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$").hasMatch(value)) {
      return _strongPassword;
    }

    return null;
  }

  static String rePasswordField(String value){
    if(value != _password) {
      return _matchPassword;
    }

    return null;
  }

  static String notMore32RequiredField(String value){
    if(value.isEmpty) {
      return _required;
    }
    if(value.length > 32) {
      return _notMoreThan32;
    }

    return null;
  }

  static String notMore32Field(String value){
    if(value.length > 32) {
      return _notMoreThan32;
    }

    return null;
  }

  static String empty(String value) {
    return null;
  }
}