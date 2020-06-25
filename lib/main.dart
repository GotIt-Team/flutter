import 'package:flutter/material.dart';
import 'package:gotit/app_theme.dart';
import 'package:gotit/enums/shared_preferences_enum.dart';
import 'package:gotit/services/shared_preferences_service.dart';
import 'package:gotit/views/pages/item_details_view.dart';
import 'package:gotit/views/pages/landing_view.dart';
import 'package:gotit/views/pages/login_view.dart';
import 'package:gotit/views/pages/registration_view.dart';
import 'package:gotit/views/pages/tabs.dart';
import 'package:gotit/views/pages/user_profile_view.dart';
import 'package:gotit/views/pages/user_settings_tab.dart';

void main() async {
  String token;
  if(WidgetsFlutterBinding.ensureInitialized() != null){
    token = await SharedPreference.getData(key: SharedPreferenceKeys.user_token);
  }
  runApp(App(token != null));
}

class App extends StatefulWidget{
  final bool isLogged;
  App(this.isLogged);
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}


class AppState extends State<App> {
  @override
  void initState(){
    super.initState();
    AppTheme.themeHandler.addListener((){
      setState(() {});
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Got It',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: AppTheme.currentMode,
      home: widget.isLogged ? TabsController() : LandingPage(),
      routes: {
        "/home": (BuildContext context) => TabsController(),
        "/item-details": (BuildContext context) => ItemDetailsPage(),
        "/sign-up": (BuildContext context) => RegistrationPage(),
        "/sign-in": (BuildContext context) => LoginPage(),
        "/profile": (BuildContext context) => UserProfile()
      }
    );
  }
}