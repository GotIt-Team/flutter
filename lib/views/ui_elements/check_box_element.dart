import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckBoxElement extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  CheckBoxElement({@required this.onChanged});
  @override
  State<StatefulWidget> createState() => CheckBoxState();
}

class CheckBoxState extends State<CheckBoxElement> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (val) {
        setState(() {
          value = val;
        });
        widget.onChanged(val);
      }
    );
  }

}