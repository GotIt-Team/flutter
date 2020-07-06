import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StyledButton extends StatefulWidget {
  final VoidCallback onpress;
  final Icon icon;
  final Text text;
  StyledButton({this.onpress, this.icon, this.text});
  @override
  State<StatefulWidget> createState() {
    return StyledButtonState();
  }
}

class StyledButtonState extends State<StyledButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: Theme.of(context).appBarTheme.color,
        elevation: 4.0,
        animationDuration: Duration(milliseconds: 1000),
        hoverElevation: 10.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[widget.icon, widget.text],
        ),
        onPressed: widget.onpress);
  }
}
