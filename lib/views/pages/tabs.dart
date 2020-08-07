import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/services/user_data_service.dart';
import 'package:gotit/views/pages/chats_tab.dart';
import 'package:gotit/views/pages/contact_us_tab.dart';
import 'package:gotit/views/pages/items_tab.dart';
import 'package:gotit/views/pages/notifications_tab.dart';
import 'package:gotit/views/ui_elements/cached_image_element.dart';

class TabsController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabsControllerState();
  }
}

class _TabsControllerState extends State<TabsController> {
  int _selectedIndex = 0;
  String userImage;
  
  // tap BottomNavigationBar will invoke this method
  void _onItemTapped(int index) {
    setState(() {
      // change _selectedIndex, fab will show or hide
      _selectedIndex = index;
      // change app bar title
    });
  }

  void initState() {
    super.initState();
    userImage = UserData.user.picture;
  }

  final int tabsLength = 4;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: tabsLength,
      child: Scaffold(
          floatingActionButton: _selectedIndex == 0
              ? FloatingActionButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    '/add-post',
                  ),
                  child: Icon(Icons.add),
                  backgroundColor: Theme.of(context).primaryColor,
                  elevation: 20.0,
                )
              : null,
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
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 35,
                              backgroundImage:
                                  CachedImage.provider(userImage),
                            ),
                          ),
                        )
                      ]),
                ),
              ),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.home)),
                  Tab(icon: Icon(Icons.notifications)),
                  Tab(icon: Icon(Icons.message)),
                  Tab(icon: Icon(Icons.contact_phone))
                ],
                onTap: _onItemTapped,
              ),
            ),
          ),
          body: TabBarView(children: <Widget>[
            ItemsTab(),
            NotificationsTab(),
            ChatsTab(),
            ContactUsTab()
          ])),
    );
  }
}
