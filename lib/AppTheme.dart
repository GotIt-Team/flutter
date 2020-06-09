import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyTheme{

  static final ThemeData defaultTheme = ThemeData(
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.blue,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.white54,
    ),
    buttonTheme: ButtonThemeData(
        buttonColor: Colors.white,  //text on button
        hoverColor: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
      textTheme: ButtonTextTheme.accent
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
              color: Colors.blue
          )
      )
    ),
    textTheme: TextTheme(
      title: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      subtitle: TextStyle(
        color: Colors.white70,
        fontSize: 18.0,
      ),
    ),
  );


  static final ThemeData anotherTheme = ThemeData(
    backgroundColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      color: Colors.lightBlue,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.black45,
    ),
    textTheme: TextTheme(
      title: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      ),

    ),
  );



  static ThemeData IsDarker(bool value){
    if(value==true){return defaultTheme;}
    else { return anotherTheme;}
  }
}
