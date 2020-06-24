import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownElement extends StatefulWidget {
  final ValueChanged<String> onSaved;
  final ValueChanged<String> onChanged;
  final List<DropdownMenuItem<String>> items;
  final InputDecoration decoration;
  final Widget icon;
  final double iconSize;

  DropdownElement({this.items, this.onSaved, this.onChanged, this.decoration, this.icon, this.iconSize});
  @override
  State<StatefulWidget> createState() => DropdownState();
}

class DropdownState extends State<DropdownElement> {
  String value;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: widget.decoration,
      value: value,
      icon: widget.icon,
      iconSize: widget.iconSize,
      onSaved: widget.onSaved,
      onChanged: (val){
        setState(() {
          value = val;
        });
        widget.onChanged(val);
      },
      items: widget.items
    );
  }
}