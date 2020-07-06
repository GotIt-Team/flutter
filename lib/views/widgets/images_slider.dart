import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/arguments/full_view_images_arguments.dart';


class ImageSlider extends StatelessWidget {
  final List<String> images;
  final bool isFullScreen;
  final int initIndex;
  ImageSlider({this.images, this.isFullScreen = false, this.initIndex = 0});
  
  List<dynamic> _mapImages(BuildContext context, double deviceWidth, Orientation rotation) {
    return images.map((image) {
      return GestureDetector(
        onTap: !isFullScreen ? () {
          Navigator.pushNamed(context, "/full-image", arguments: FullImagesArgumments(index: images.indexOf(image) , images: images));
        } : null,
        child: Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Image.network(
              image, 
              fit: !isFullScreen ? BoxFit.cover : (rotation == Orientation.landscape ? BoxFit.fitHeight : BoxFit.fitWidth),
              width: deviceWidth * (isFullScreen ? 1 : 0.8)
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final Orientation rotation = MediaQuery.of(context).orientation;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double sliderHeight = rotation == Orientation.landscape ? deviceHeight * .75 : deviceHeight * .3;
    
    return CarouselSlider(
      items: _mapImages(context, deviceWidth, rotation),
      options: CarouselOptions(
        height: isFullScreen ? deviceHeight : sliderHeight,
        autoPlay: !isFullScreen,
        enlargeCenterPage: true,
        viewportFraction: isFullScreen ? 1.0 : 0.8,
        initialPage: initIndex
      ),
    );
  }
}
