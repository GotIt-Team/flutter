import 'package:flutter/material.dart';
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
                Image.asset("assets/images/logo.png", height:MediaQuery.of(context).size.height * 0.6),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.50,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: RaisedButton(
                      child: Text(
                        'Log in',
                        style: TextStyle(fontSize: 22), 
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/sign-in')
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.50,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: RaisedButton(
                      child: Text(
                        'Registration', 
                        style: TextStyle(fontSize: 22),
                      ),
                      onPressed: () =>  Navigator.pushNamed(context, '/sign-up')
                    ),
                  ),
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