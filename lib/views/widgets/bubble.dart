import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Bubble extends StatelessWidget {
  final AlignmentGeometry alignment;
  final Widget child;
  final Color backgroundColor;
  final double padding;
  Bubble({this.padding=10,this.alignment, this.child, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.80
        ),
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
        margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.005),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ]
        ),
        child: child
      ),
    );
  }
}