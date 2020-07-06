import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandText extends StatefulWidget {
  final String text;
  final int maxLength;
  final Color clickableTextColor;
  final String collapsedText;
  final String expandedText;
  final TextStyle style;
  final TextDirection textDirection;

  ExpandText(this.text, {
    this.maxLength = 240,
    this.collapsedText = 'Show more',
    this.expandedText = 'Show less',
    this.clickableTextColor,
    this.style,
    this.textDirection
  });
  
  @override
  State<StatefulWidget> createState() => ExpandTextState();
}

class ExpandTextState extends State<ExpandText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: widget.text.length <= widget.maxLength ?
      Text(widget.text, style: widget.style) : 
      Column(
        children: <Widget>[
          Text(
            isExpanded ? widget.text : (widget.text.substring(0, widget.maxLength)),
            style: widget.style,
            textDirection: widget.textDirection,
          ),
          FlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  isExpanded ? widget.expandedText : widget.collapsedText,
                  style: TextStyle(color: widget.clickableTextColor),
                  textDirection: widget.textDirection
                ),
              ],
            ),
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
          ),
        ],
      ),
    );
  }
  
}