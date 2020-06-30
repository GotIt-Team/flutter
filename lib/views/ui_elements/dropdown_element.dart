import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/services/validator_service.dart';

class DropdownElement extends StatefulWidget {
  final ValueChanged<String> onSaved;
  final ValueChanged<String> onChanged;
  final List<DropdownMenuItem<String>> items;
  final InputDecoration decoration;
  final Widget icon;
  final double iconSize;
  final String value;
  final double height;
  final double width;
  final ValueChanged<String> validator;

  DropdownElement({this.height=88,this.width=60,this.validator,@required this.items, this.onSaved, this.onChanged, this.decoration, this.icon, this.iconSize, this.value});
  @override
  State<StatefulWidget> createState() => DropdownState(value);
}

class DropdownState extends State<DropdownElement> {
  String value;
  DropdownState(this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
          child: DropdownButtonFormField(
            
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
        items: widget.items
      ),
    );
  }
}