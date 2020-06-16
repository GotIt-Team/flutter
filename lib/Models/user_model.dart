//every user should have a service class to handle its data from the api
//or we may use a generic repository



class ViewModel {
  String _name,_email,_password1,_password2,_phone,_address,_gender;
  //Setter Functions
  set Name (String name){this._name=name;}
  set Email (String email){this._email=email;}
  set Password1 (String pass1){this._password1=pass1;}
  set Password2 (String pass2){this._password2=pass2;}
  set PhoneNumber (String Phone){this._phone=Phone;}
  set Gender (String gender){this._gender=gender;}
  set Address (String address){this._address=address;}
  //Getter Functions
  String get Name{return _name;}
  String get Email{return _email;}
  String get Password1{return _password1;}
  String get Password2{return _password2;}
  String get PhoneNumber{return _phone;}
  String get Gender{return _gender;}
  String get Address{return _address;}



}