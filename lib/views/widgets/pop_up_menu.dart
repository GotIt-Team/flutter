import 'package:decamelize/decamelize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/enums/MenuActions.dart';
import 'package:gotit/enums/menu_results.dart';
import 'package:gotit/helpers.dart';

class PopUpMenuElement extends StatelessWidget {
  final MenuActions actions;
  final PopupMenuItemSelected<MenuResult> onSelect;
  PopUpMenuElement({@required this.actions, this.onSelect});
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context) {
        return Helpers.getStringFromEnum(actions)
            .split('_')
            .map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(decamelize(choice, ' ')),
          );
        }).toList();
      },
      onSelected: (String selected) {
        MenuResult chosen =
            Helpers.getEnumFromString(MenuResult.values, selected);
        if (chosen == null) {
          onSelect(MenuResult.none);
        } else {
          onSelect(chosen);
        }
      },
    );
  }
}
