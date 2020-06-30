import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final List<AssetImage> _images;
  ImageSlider(this._images);
  @override
  Widget build(BuildContext context) {
    final Orientation rotation = MediaQuery.of(context).orientation;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double sliderHeight =(rotation==Orientation.landscape)? deviceHeight*.75:deviceHeight*.3;
    
    return Container(
      height: sliderHeight,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: _images,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(seconds: 1),
        
        autoplay: true,
      ),
    );
  }
}
