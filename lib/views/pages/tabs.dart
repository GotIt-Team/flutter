import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/views/pages/home_tab.dart';
import 'package:gotit/views/pages/notifications.dart';

class TapsController extends StatelessWidget {
  final int tabsLength;
  final String appBarTitle;
  TapsController(this.tabsLength,this.appBarTitle);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabsLength,
      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.notifications),
            )
          ]),
        ),
        body: TabBarView(children: <Widget>[HomeTap(), Notifications()]),
      ),
    );
  }
}
