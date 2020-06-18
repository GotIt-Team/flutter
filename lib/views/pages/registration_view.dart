import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:gotit/presenters/registration_presenter.dart';

class RegistrationPage extends StatelessWidget {
  final RegisterationPresenter _registerationPresenter = RegisterationPresenter();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    double valuePadding = MediaQuery.of(context).size.height * 0.01;
    double valuePadding2 = MediaQuery.of(context).size.height * 0.02;
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Form(
        key: formkey,
        child: ListView(
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
                validator: _registerationPresenter.validateName,
                onSaved: _registerationPresenter.setName,
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
                validator: _registerationPresenter.validateEmail,
                onSaved: _registerationPresenter.setEmail,
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
                validator: _registerationPresenter.validatePassword,
                onSaved: _registerationPresenter.setPassword,
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
                validator: _registerationPresenter.validateRepeatePassword,
                onSaved: _registerationPresenter.setRepeatePassword,
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
                validator: _registerationPresenter.validatePhone,
                onSaved: _registerationPresenter.setPhoneNumber,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(valuePadding2, valuePadding, valuePadding2, valuePadding),
              child: DropDownFormField(
                titleText: 'City',
                hintText: 'Please enter your City',
                value: _registerationPresenter.userRegistration.city,
                onSaved: _registerationPresenter.setCity,
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
              ),
            ),
            Padding(
              padding: EdgeInsets.all(valuePadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(valuePadding),
                    child: Center(
                      child: FlatButton(
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          print('submit');
                        },
                        colorBrightness: Brightness.dark,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(valuePadding),
                    child: Center(
                      child: FlatButton(
                        child: Text('Cancel',style:TextStyle(color: Colors.white, fontSize: 20)),
                        onPressed: () {
                          print('cancle');
                        },
                        colorBrightness: Brightness.dark,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
