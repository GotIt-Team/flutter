import 'package:flutter/material.dart';
import 'AppTheme.dart';
import 'views/pages/user_profile_view.dart';

void main() => runApp(App());


class App extends StatefulWidget{
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
      title: 'Flutter Demo',
      theme: AppTheme.defaultTheme,
      darkTheme: AppTheme.anotherTheme,
      themeMode: AppTheme.currentMode,
      home:HomePage()
      
    );
  }
}

