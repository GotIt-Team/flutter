import 'package:flutter/material.dart';
import 'AppTheme.dart';
import 'views/pages/user_profile_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
MyTheme appTheme ;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme.IsDarker(false),
      home:HomePage()
      
    );
  }
}

