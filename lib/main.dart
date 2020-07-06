import 'package:flutter/material.dart';
import 'package:gotit/app_theme.dart';
import 'package:gotit/services/user_data_service.dart';
import 'package:gotit/views/pages/add_post_view.dart';
import 'package:gotit/views/pages/landing_view.dart';
import 'package:gotit/views/pages/login_view.dart';
import 'package:gotit/views/pages/registration_view.dart';
import 'package:gotit/views/pages/tabs.dart';
import 'package:gotit/views/pages/user_profile_view.dart';
import 'package:gotit/views/pages/chat_room_view.dart';
import 'package:gotit/views/widgets/full_image_view.dart';

void main() async {
  if(WidgetsFlutterBinding.ensureInitialized() != null){
    await UserData.init();
  }

  runApp(App(UserData.isLogged()));
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
        "/sign-up": (BuildContext context) => RegistrationPage(),
        "/sign-in": (BuildContext context) => LoginPage(),
        "/profile": (BuildContext context) => UserProfile(),
        "/chat-messages": (BuildContext context) => ChatRoomPage(),
        "/add-post": (BuildContext context) => AddPostView(),
        "/full-image":(BuildContext context) => FullImageView(),
      }
    );
  }
}