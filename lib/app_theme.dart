import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeHandler with ChangeNotifier {
  bool _isDark = false;

  bool get isDark {
    return _isDark;
  }

  void switchTheme(bool isDark) {
    _isDark = isDark;
    notifyListeners();
  }
}

class AppTheme {
  static final Color _lightPrimary = Color.fromARGB(255, 59, 117, 133);
  static final Color _lightSecondary = Color.fromARGB(255, 69, 140, 158);
  static final Color _lightBackground = Color.fromARGB(255, 209, 208, 181);
  static final Color _lightSubtitle = Color.fromARGB(255, 189, 195, 199);

  static ThemeHandler themeHandler = ThemeHandler();

  static final ThemeData lightTheme = ThemeData(
    primaryColor: _lightPrimary,
    primaryColorLight: _lightPrimary,
    appBarTheme: AppBarTheme(
      color: _lightSecondary,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    
    backgroundColor: _lightBackground,
    scaffoldBackgroundColor: _lightBackground,
    
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    
    buttonTheme: ButtonThemeData(
      buttonColor: _lightPrimary, //text on button
      hoverColor: _lightSecondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      textTheme: ButtonTextTheme.primary
    ),
    
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: Colors.black)
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5))
      )
    ),

    fontFamily: 'Roboto',
    
    textTheme: TextTheme(
      title: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      ),
      button: TextStyle(
        color: Colors.black,
        fontSize: 16.0
      ),
      subtitle: TextStyle(
        color: _lightSubtitle,
        fontSize: 18.0,
      ),
    ),
    
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.brown,
    backgroundColor: Colors.brown,
    scaffoldBackgroundColor: Colors.brown,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    textTheme: TextTheme(
      title: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      ),
    ),
  );

  static ThemeMode get currentMode {
    return themeHandler.isDark ? ThemeMode.dark : ThemeMode.light;
  }

  static void switchTheme(bool isDark) {
    themeHandler.switchTheme(isDark);
  }
}


// app colors
/***
 * system bar color & primary color (#3B7585)
 * app bar color (#458C9E)
 * app background (#D1D0B5)
 * text primary color (#000000)
 * sub title color (#BDC3C7)
***/