import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  final Widget label;
  final VoidCallback function;
  final Icon icon;
  TagChip({this.function, this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: ()=>print('fg'),
      label: label,
      avatar: icon,
      elevation: 4.0,
      
      labelStyle: TextStyle(color: Color(0xff000000), fontSize: 14.0),
    );
  }
}
