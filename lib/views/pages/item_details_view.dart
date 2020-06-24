import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/presenters/item_details_presenter.dart';
import 'package:gotit/views/widgets/images_slider.dart';

class ItemDetailsPage extends StatefulWidget{
  final ItemDetailsPresenter _itemDetailsPresenter = ItemDetailsPresenter();
  @override
  State<StatefulWidget> createState() => ItemDetailsState();
}

class ItemDetailsState extends State<ItemDetailsPage>{
  int id = 0;
  
  @override
  void initState() {
    super.initState();
    widget._itemDetailsPresenter.getInnerDetails();
    Future.delayed(Duration.zero, () {
      id = ModalRoute.of(context).settings.arguments;
    });
  }
  List<AssetImage>mapImages(List<String>images){
    return images.map((String image) => AssetImage(image)).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Item')), 
      body: ImageSlider(mapImages(widget._itemDetailsPresenter.detailsModel.images)),
    );
  }
}