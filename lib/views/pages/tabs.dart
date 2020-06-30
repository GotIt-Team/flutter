import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/views/pages/chats_tab.dart';
import 'package:gotit/views/pages/contact_us_tab.dart';
import 'package:gotit/views/pages/items_tab.dart';
import 'package:gotit/views/pages/notifications_tab.dart';

class TabsController extends StatelessWidget {
  final int tabsLength = 4;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: tabsLength,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(145.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Center(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image(
                      height: 75,
                      image: AssetImage('assets/images/app_bar_logo.png'),
                      fit: BoxFit.contain,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/profile'),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40) ,
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage('assets/images/Sheka.jpg'),
                        ),
                      ),
                    )
                  ]
                ),
              ),
            ),
            bottom: TabBar(tabs: <Widget>[
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.notifications)),
              Tab(icon: Icon(Icons.message)),
              Tab(icon: Icon(Icons.contact_phone))
            ]),
          ),
        ),
        body: TabBarView(children: <Widget>[ItemsTab(), NotificationsTab(), ChatsTab(), ContactUsTab()])
      ),
    );
  }
}