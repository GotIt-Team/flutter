import 'package:flutter/material.dart';
import 'package:gotit/views/widgets/empty_state.dart';
import 'package:gotit/views/widgets/item_card.dart';
import 'package:gotit/presenters/item_presenter.dart';
import 'package:gotit/views/widgets/progress_dialog.dart';

class ItemsTab extends StatefulWidget {
  final ItemPresenter itemPresenter = ItemPresenter();
  final bool isUserTab, lostItems;
  ItemsTab({this.isUserTab = false, this.lostItems = true});
  @override
  State<StatefulWidget> createState() => ItemsState();
}

class ItemsState extends State<ItemsTab> {
  int itemCount = 0;
  int pageNo = 1;
  int pageSize = 10;

  void loadItems() {
    ProgressDialog.show(
      context: context,
      isCircular: false,
      method: () =>  widget.itemPresenter.getItems(pageNo, pageSize, widget.isUserTab ? 'user/items' : 'item', widget.lostItems).then((value) {
        setState(() {
          if(widget.itemPresenter.items != null){
            itemCount = widget.itemPresenter.items.length;
          } else {
            itemCount = 0;
          }
        });
      })
    );
  }

  @override
  void initState() {
    super.initState();
    itemCount = 0;
    Future.delayed(Duration.zero, loadItems);
  }

  @override
  Widget build(BuildContext context) {
    itemCount = widget.itemPresenter.items.length;
    return itemCount > 0 ? ListView.builder(itemCount: itemCount,
      itemBuilder: (BuildContext context,int index){
        return Center(
          child: ItemCard(
            userName: widget.itemPresenter.items[index].user.name,
            userImage: widget.itemPresenter.items[index].user.picture,
            content: widget.itemPresenter.items[index].content,
            creationDate: widget.itemPresenter.items[index].creationDate,
            image: widget.itemPresenter.items[index].image,
            id: widget.itemPresenter.items[index].id,
            isFirst: index == 0,
          ),
        );
      },
    ) : EmptyState(
      image: 'assets/images/no_items.png',
      message: 'There is no items',
    );
  }
}
