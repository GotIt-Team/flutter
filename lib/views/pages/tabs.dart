import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/views/pages/chat_list_view.dart';
import 'package:gotit/views/pages/contact_us_tab.dart';
import 'package:gotit/views/pages/items_tab.dart';
import 'package:gotit/views/pages/notifications_tab.dart';

class TabsController extends StatelessWidget {
  final int tabsLength = 4;
  final String appBarTitle = 'Got It';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabsLength,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(145.0),
          child: AppBar(
            leading: Image(
              image: AssetImage('assets/images/logo.png'),
            ),
            title: Text(
              appBarTitle,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            actions: <Widget>[
              
            ],
            bottom: TabBar(tabs: <Widget>[
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.notifications)),
              Tab(icon: Icon(Icons.message)),
              Tab(icon: Icon(Icons.contact_phone))
            ]),
          ),
        ),
        body: TabBarView(children: <Widget>[ItemsTab(), NotificationsTab(), ChatListPage(), ContactUsTab()])
      ),
    );
  }
}