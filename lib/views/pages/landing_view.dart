import 'package:flutter/material.dart';
import 'package:gotit/views/ui_elements/rounded_buton_element.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LandingPage extends StatelessWidget{  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/landing.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset("assets/images/landing_logo.png", height:MediaQuery.of(context).size.height * 0.6),
                RoundedButton(
                  onPressed: () => Navigator.pushNamed(context, '/sign-in'),
                  padding: EdgeInsets.all(8.0),
                  label: 'Log in',
                  width: MediaQuery.of(context).size.width * 0.50,
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                RoundedButton(
                  onPressed: () => Navigator.pushNamed(context, '/sign-up'),
                  padding: EdgeInsets.all(8.0),
                  label: 'Registration',
                  width: MediaQuery.of(context).size.width * 0.50,
                  height: MediaQuery.of(context).size.height * 0.07
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        padding: EdgeInsets.all(15),
                        child: Icon(MdiIcons.facebook, size: 25),
                        onPressed: () => print('facebook'),
                        shape: CircleBorder()
                      ),
                      RaisedButton(
                        padding: EdgeInsets.all(15),
                        child: Icon(MdiIcons.google, size: 25),
                        onPressed: () => print('Google'),
                        shape: CircleBorder()
                      )
                    ],
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}