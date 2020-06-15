import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/Presenters/post_inner_details_presenter.dart';
import 'package:gotit/views/widgets/images_slider.dart';

class PostInnerView extends StatefulWidget{
  final int id;
  final PostInnerDetalsPres _innerDetalsPres = PostInnerDetalsPres();
  PostInnerView({this.id});
  @override
  State<StatefulWidget> createState() {
    
    return PostInnerViewState();
  }

}
class PostInnerViewState extends State<PostInnerView>{
  @override
  void initState() {
    widget._innerDetalsPres.getInnerDetails();
    super.initState();

  }
  List<AssetImage>mapImages(List<String>images){
    return images.map((String image){
      return AssetImage(image);
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Post'),), 
      body: ImageSlider(mapImages(widget._innerDetalsPres.detailsModel.images)),
    );
  }
}