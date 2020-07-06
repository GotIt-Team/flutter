import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/views/ui_elements/rounded_buton_element.dart';

class Pagination extends StatefulWidget {
  final Future<bool> Function() onLoad;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final int pageSize;
  final int pageNo;
  final int totalCount;
  Pagination({this.itemBuilder, this.onLoad, this.itemCount, this.pageNo, this.pageSize, this.totalCount});

  @override
  State<StatefulWidget> createState() => PaginationState();

}

class PaginationState extends State<Pagination> {
  bool isLoading;
  
  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.itemCount + 1,
      itemBuilder: (context, index) {
        return index != widget.itemCount ?
          widget.itemBuilder(context, index) :
          Center(
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
                    });
                  }
                });
              },
            ) : CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)
            )
          );
      },
    );
  }

}