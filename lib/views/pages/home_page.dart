import 'package:flutter/material.dart';
import 'package:gotit/views/widgets/item_card.dart';
import 'package:gotit/Presenters/home_presenter.dart';

class HomePage extends StatefulWidget {
  final HomePresenter homePresenter = HomePresenter();
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomePage> {
  int pageNo = 1;
  @override
  void initState() {
    widget.homePresenter.getItems(pageNo: pageNo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: widget.homePresenter.items.length,
      itemBuilder: (context, index){
        return Center(
          child: ItemCard(
            userName: widget.homePresenter.items[index].user.name,
            userImage: widget.homePresenter.items[index].user.image,
            content: widget.homePresenter.items[index].content,
            creationDate: widget.homePresenter.items[index].creationData,
            image: widget.homePresenter.items[index].image,
          ),
        );
      },
    );
  }
}
