import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/services/user_data_service.dart';
import 'package:gotit/views/pages/user_items_tab.dart';
import 'package:gotit/views/pages/user_requests_tab.dart';
import 'package:gotit/views/pages/user_settings_tab.dart';
import 'package:gotit/views/ui_elements/cached_image_element.dart';

class UserProfileTabs extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150.0),
          child: AppBar(
            flexibleSpace: Center(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40) ,
                        border: Border.all(
                          width: 2,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: CachedImage.provider(UserData.user.picture),
                      ),
                    ),
                  ]
                ),
              ),
            ),
            bottom: TabBar(tabs: <Widget>[
              Tab(icon: Icon(Icons.list), text: 'Items'),
              Tab(icon: Icon(Icons.receipt), text: 'Requests'),
              Tab(icon: Icon(Icons.settings), text: 'Settings')
            ]),
          ),
        ),
        body: TabBarView(children: <Widget>[UserItemsTab(), UserRequestsTab(), UserSettingsTab()])
      )
    );
  }

}