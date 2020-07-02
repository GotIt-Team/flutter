import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownElement extends StatefulWidget {
  final ValueChanged<String> onSaved;
  final ValueChanged<String> onChanged;
  final List<String> items;
  final InputDecoration decoration;
  final Widget icon;
  final double iconSize;
  final String value;
  final ValueChanged<String> validator;

  DropdownElement({this.validator, @required this.items, this.onSaved, this.onChanged, this.decoration, this.icon, this.iconSize=24, this.value});
  @override
  State<StatefulWidget> createState() => DropdownState(value);
}

class DropdownState extends State<DropdownElement> {
  String value;
  DropdownState(this.value);

  _mapDropdownItems(List<String> items) {
    return items.map((item) => DropdownMenuItem<String>(child: Text(item),value: item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      validator: widget.validator,
      decoration: widget.decoration,
      value: value,
      icon: widget.icon,
      iconSize: widget.iconSize,
      onSaved: widget.onSaved,
      onChanged: (val){
        setState(() {
          value = val;
        });
        if(widget.onChanged != null) {
          widget.onChanged(val);
        }
      },
      items: _mapDropdownItems(widget.items),
      isDense: true
    );
  }
}