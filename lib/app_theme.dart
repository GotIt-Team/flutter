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
  static ThemeHandler themeHandler = ThemeHandler();

  static final ThemeData lightTheme = ThemeData(
    backgroundColor: Color.fromARGB(255, 209, 208, 181),
    scaffoldBackgroundColor: Color.fromARGB(255, 209, 208, 181),
    appBarTheme: AppBarTheme(
      color: Color.fromARGB(255, 69, 140, 158),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.white54,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.red, //text on button
      hoverColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      textTheme: ButtonTextTheme.accent
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: Colors.blue)
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5))
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