import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String label;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color backgroundColor;
  final Color textColor;
  final double width;
  final double height;
  final VoidCallback onPressed;
  RoundedButton({@required this.onPressed, this.label, this.margin, this.padding, 
    this.backgroundColor, this.textColor, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(0),
      child: Container(
        width: width,
        height: height,
        margin: margin,
        child: RaisedButton(
          color: backgroundColor,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 22,
              color: textColor
            ), 
          ),
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width)
          ),
        ),
      ),
    );
  }
  
}