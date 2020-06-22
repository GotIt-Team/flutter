import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/presenters/registration_presenter.dart';
import 'package:gotit/views/widgets/alert_dialog.dart';
import 'package:gotit/enums/dialog_buttons_enum.dart';
import 'package:gotit/enums/dialog_result_enum.dart';
import 'package:gotit/helpers.dart';

class RegistrationPage extends StatelessWidget {
  final RegisterationPresenter _registrationPresenter = RegisterationPresenter();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String genderValue,countryValue,cityValue;

  List <String> genderList=['male','female'];
  List <String> cityList=['cairo','giza','fayoum'];
  List <String> countryList=['Egypt'];

  void singup(){
    if(formkey.currentState.validate()) {
      formkey.currentState.save();

     //_registrationPresenter.registrationRequest();
    }
    else {print('some thing error');}
  }
  
  @override
  Widget build(BuildContext context) {
    double valuePadding = MediaQuery.of(context).size.height * 0.01;
    return Scaffold(

      body: DialogBox.dialog(
          context: context,
          title: Text('Registration'),
          content: Form(
            key: formkey,
            child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(valuePadding),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Name',
                      hintText: ('Enter Your Name'),
                    ),
                    validator: _registrationPresenter.validateName,
                    onSaved: _registrationPresenter.setName,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(valuePadding),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: 'Email',
                      hintText: ('Enter Your Email'),
                    ),
                    validator: _registrationPresenter.validateEmail,
                    onSaved: _registrationPresenter.setEmail,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(valuePadding),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: 'Password',
                      hintText: ('Enter Your Password'),
                    ),
                    validator: _registrationPresenter.validatePassword,
                    onSaved: _registrationPresenter.setPassword,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(valuePadding),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: 'Confirm Password',
                      hintText: ('Enter Your Password again'),
                    ),
                    validator: _registrationPresenter.validateRepeatePassword,
                    onSaved: _registrationPresenter.setRepeatePassword,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(valuePadding),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(Icons.phone),
                      labelText: 'Phone number',
                      hintText: ('Enter Your Phone Number'),
                    ),
                    validator: _registrationPresenter.validatePhone,
                    onSaved: _registrationPresenter.setPhoneNumber,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(valuePadding),child:DropdownButtonFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.perm_identity),
                      hintText: 'Gender',
                  ),
                  value: genderValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  onSaved: (value){
                    _registrationPresenter.setGender(value);
                  },
                  onChanged: (value){
                    genderValue=value;
                  },
                  items:genderList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ) ,
                ),
                Padding(
                  padding: EdgeInsets.all(valuePadding),child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.flag),
                      hintText: 'Country',

                  ),
                  value: countryValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  onSaved: (value){
                    _registrationPresenter.setCountry(value);
                  },
                  onChanged: (value){
                    countryValue=value;
                  },
                  items:countryList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ) ,),
                Padding(
                  padding: EdgeInsets.all(valuePadding),child:DropdownButtonFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.location_city),
                      hintText: 'City',
                  ),
                  value: cityValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  onSaved: (value){
                    _registrationPresenter.setCity(value);
                  },
                  onChanged: (value){
                    cityValue=value;
                  },
                  items:cityList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ) ,),
              ],
            ),
          ),
          dialogButton: DialogButtons.ok_cancel,
          onPress: (DialogResult result){
            String buttonStringResult = Helpers.getStringFromEnum(result);
            print(buttonStringResult);
            if(buttonStringResult == 'ok')
              {  singup();}
               else{ Navigator.pop(context);}
          }
      ) ,
    );
  }
}
