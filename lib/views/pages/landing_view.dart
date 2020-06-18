import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LandingPage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset("assets/images/logo.png", width:MediaQuery.of(context).size.width*0.7, height:MediaQuery.of(context).size.height*0.5,),
              Text('GOT IT',style:TextStyle(color: Colors.blue[100],fontSize: 50,fontWeight:FontWeight.bold, ),),
              FlatButton(
                child: Text('Registration'),
                onPressed: () {Navigator.pushNamed(context, 'RegistrationView');},
                //color: Colors.white,
              ),
              FlatButton(
                child: Text('Log in'),
                onPressed: () {Navigator.pushNamed(context, 'LoginView');},
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: Icon(MdiIcons.facebook,),

                    onPressed: (){print('facebook');},
                  ),
                  FlatButton(
                    child: Icon(MdiIcons.google,),

                    onPressed: (){print('Google');},
                  )
                ],
              ),
            ],
          )
      ),

    );
  }
}