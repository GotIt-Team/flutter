import 'package:flutter/material.dart';
import 'package:gotit/app_theme.dart';
import 'package:gotit/views/pages/login_view.dart';
import 'package:gotit/views/pages/post_inner_view.dart';
import 'package:gotit/views/pages/tabs.dart';

void main() => runApp(App());

class App extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}


class AppState extends State<App> {
  int numperOfTabs=2;
  String appBarTitle='home';
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
      home: TapsController(numperOfTabs,appBarTitle),
      routes: {
        "/home": (BuildContext context) => TapsController(numperOfTabs, appBarTitle)
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'item') {
          final int id = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => PostInnerView(id:id),
          );
        }

        return null;
      },
    );
  }
}