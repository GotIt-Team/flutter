import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/views/ui_elements/rounded_buton_element.dart';

class Pagination extends StatefulWidget {
  final Future<bool> Function() onLoad;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final bool hasMore;
  Pagination({this.itemBuilder, this.onLoad, this.itemCount, this.hasMore});

  @override
  State<StatefulWidget> createState() => PaginationState();

}

class PaginationState extends State<Pagination> {
  bool isLoading;
  bool hasError;
  
  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListView.builder(itemCount: widget.itemCount, itemBuilder: widget.itemBuilder),
        widget.hasMore ? Center(
          child: !isLoading ? RoundedButton(
            label: 'Show more',
            onPressed: () {
              setState(() {
                isLoading = true;
              });
              widget.onLoad().then((value) {
                if(value) {
                  setState(() {
                    isLoading = false;
                    hasError = true;
                  });
                } else {
                  setState(() {
                    isLoading = false;
                    hasError = true;
                  });
                }
              });
            },
          ) : CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)
          )
        ) : Container()
      ],
    );
  }

}