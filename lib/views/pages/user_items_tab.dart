import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/views/pages/items_tab.dart';

class UserItemsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ItemsTab(
      isUserTab: true,
      lostItems: true,
    );
  }
}