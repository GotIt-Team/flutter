import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:gotit/Presenters/RegistrationPresenter.dart';
import 'package:gotit/Services/user_information.dart';


class RegistrationPage extends StatefulWidget{
  RegisterPresinter _presinterRegistration = new RegisterPresinter();

  State<StatefulWidget>createState()=>RegistrationState();
}

class RegistrationState extends State<RegistrationPage>{
  String dropDownValue , dropDownValue1;
  final GlobalKey <FormState> formkey = new GlobalKey<FormState>();
  void submitForm(){
    if(formkey.currentState.validate()) {
      formkey.currentState.save();
      SendUserData(); // post http request 'send user information to server'
      widget._presinterRegistration.x();
    }
    else {print('some thing error');}
  }
  void cancelRegistration() {
    widget._presinterRegistration.cancelForm();
    Navigator.pop(context, 'LandingView');

  }

  Widget build (BuildContext context)

  {
    double valuePadding = MediaQuery.of(context).size.height * 0.01 ;
    double valuePadding2 = MediaQuery.of(context).size.height * 0.02 ;
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),

      ),
      body:new Form(
        key:formkey ,
        child: ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(valuePadding),child:TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Name',
                hintText: ('Enter Your Name'),
              ),
              validator: widget._presinterRegistration.validateName,
              onSaved: widget._presinterRegistration.RName,

            ),),
            Padding(padding: EdgeInsets.all(valuePadding),child:TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                labelText: 'Email',
                hintText: ('Enter Your Email'),
              ),
              validator:widget._presinterRegistration.validateEmail,
              onSaved:widget._presinterRegistration.REmail,
            ),),
            Padding(padding: EdgeInsets.all(valuePadding),child:TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.vpn_key),
                labelText: 'Password',
                hintText: ('Enter Your Password'),
              ),
              validator:widget._presinterRegistration.validatePassword1,
              onSaved:widget._presinterRegistration.RPassword1,
            ),),
            Padding(padding: EdgeInsets.all(valuePadding),child:TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.vpn_key),
                labelText: 'Confirm Password',
                hintText: ('Enter Your Password again'),
              ),
              validator:widget._presinterRegistration.validatePassword2,
              onSaved: widget._presinterRegistration.RPassword2,
            ),),
            Padding(padding: EdgeInsets.all(valuePadding),child:TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                icon: Icon(Icons.phone),
                labelText: 'Phone number',
                hintText: ('Enter Your Phone Number'),
              ),
              validator:widget._presinterRegistration.validatePhone,
              onSaved:widget._presinterRegistration.RPhoneNumber,
            ),),
            Padding(padding: EdgeInsets.fromLTRB(valuePadding2,valuePadding,valuePadding2,valuePadding),child:DropDownFormField(

              titleText: 'City',
              // icon:Icons.ac_unit,
              hintText: 'Please enter your City',
              value: dropDownValue,
              onSaved: (value){
                setState(() {
                  widget._presinterRegistration.RAddress(value);
                });
              },
              onChanged: (value){
                setState(() {
                  dropDownValue=value;
                });
              },
              dataSource: [
                {
                  "display": "Fayoum",
                  "value": "Fayoum",
                },
                {
                  "display": "Giza",
                  "value": "Giza",
                },
              ],
              textField: 'display',
              valueField: 'value',
            ),),
            Padding(padding: EdgeInsets.fromLTRB(valuePadding2,valuePadding,valuePadding2,valuePadding),child:DropDownFormField(

              titleText: 'Gender',
              // icon:Icons.ac_unit,
              hintText: 'Please enter your Gender',
              value: dropDownValue1,
              onSaved: (value){
                setState(() {
                  widget._presinterRegistration.RGender(value);
                });
              },
              onChanged: (value){
                setState(() {
                  dropDownValue1=value;
                });
              },
              dataSource: [
                {
                  "display": "Male",
                  "value": "Male",
                },
                {
                  "display": "Female",
                  "value": "Female",
                },
                {
                  "display":"Organization",
                  "value":"Organization",
                },
              ],
              textField: 'display',
              valueField: 'value',
            ),),
            Padding(padding: EdgeInsets.all(valuePadding),child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(valuePadding),child:Center(
                  child: FlatButton(

                    child: Text('Submit',style: TextStyle(color: Colors.white,fontSize: 20),),
                    onPressed: submitForm,
                    colorBrightness: Brightness.dark ,
                    color: Colors.blueAccent,
                  ),
                ),),
                Padding(padding: EdgeInsets.all(valuePadding),child:Center(
                  child: FlatButton(
                    child: Text('Cancel',style: TextStyle(color: Colors.white,fontSize: 20),),
                    onPressed: cancelRegistration,
                    colorBrightness: Brightness.dark ,
                    color: Colors.blueAccent,
                  ),
                ),),
              ],
            ),
            )
          ],
        ),
      ),
    );

  }
}