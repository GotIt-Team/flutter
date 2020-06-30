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
  
  static final Color _darkPrimary = Color.fromARGB(255, 59, 117, 133);
  static final Color _darkSecondary = Color.fromARGB(255, 35, 45, 54);
  static final Color _darkBackground = Color.fromARGB(255, 28, 34, 39);

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
        borderRadius: BorderRadius.circular(40),
        borderSide: BorderSide(color: Colors.black)
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40)
      )
    ),
    
    tabBarTheme: TabBarTheme(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.white,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: _lightPrimary,
            width: 4.0,
          ),
        ),
      )
    ),

    fontFamily: 'Roboto',
    textTheme: TextTheme(
      title: TextStyle(
        color: Colors.white,
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
    primaryColor: _darkPrimary,
    primaryColorDark: _darkPrimary,
    appBarTheme: AppBarTheme(
      color: _darkSecondary,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    
    backgroundColor: _darkBackground,
    scaffoldBackgroundColor: _darkBackground,
    
    iconTheme: IconThemeData(
      color: Colors.white,
    ),

    buttonTheme: ButtonThemeData(
      buttonColor: _darkPrimary, //text on button
      hoverColor: _darkSecondary,
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
    
    tabBarTheme: TabBarTheme(
      labelColor: _lightPrimary,
      unselectedLabelColor: Colors.white,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: _lightPrimary,
            width: 4.0,
          ),
        ),
      )
    ),
    dialogBackgroundColor: _darkSecondary,
    cardTheme: CardTheme(
      color: _darkBackground
    ),

    fontFamily: 'Roboto',
    textTheme: TextTheme(
      title: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      button: TextStyle(
        color: Colors.white,
        fontSize: 16.0
      ),
      subtitle: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      )
    )
  );

  static ThemeMode get currentMode {
    return themeHandler.isDark ? ThemeMode.dark : ThemeMode.light;
  }

  static void switchTheme(bool isDark) {
    themeHandler.switchTheme(isDark);
  }
}
