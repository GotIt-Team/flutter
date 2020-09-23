import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/views/ui_elements/cached_image_element.dart';


class SelectObject extends StatelessWidget {
  
  List<dynamic> _mapImages(BuildContext context, double deviceWidth, Orientation rotation) {
    var images = ModalRoute.of(context).settings.arguments as List<String>;
    return images.map((image) {
      return Container(
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedImage.provider(image),
            fit: (rotation == Orientation.landscape ? BoxFit.fitHeight : BoxFit.fitWidth),
          ),
        ),
        child: Container(),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final Orientation rotation = MediaQuery.of(context).orientation;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(title: Text('Hello'),),
      body: CarouselSlider(
        items: _mapImages(context, deviceWidth, rotation),
        options: CarouselOptions(
          height: deviceHeight,
          autoPlay: false,
          enlargeCenterPage: true,
          viewportFraction: 1.0
        ),
      ),
    );
  }
}
