import 'package:flutter/material.dart';

import 'package:gotit/app_theme.dart';

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
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: AppTheme.currentMode,
      //home: 
    );
  }
}

