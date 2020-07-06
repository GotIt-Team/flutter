import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/arguments/full_view_images_arguments.dart';

class FullImageView extends StatelessWidget {
  List<NetworkImage> _mapToNetworkImages(List<String> images) {
    return images.map((String image) {
      return NetworkImage(image);
    }).toList();
  }

  Carousel _buildSlider(List<NetworkImage> images, int index) {
    if (index != 0) {
  
      images.insert(0, images[index]);
      images.removeAt(index+1);
    }
    return Carousel(
      boxFit: BoxFit.fitWidth,
      images: images,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(seconds: 1),
      defaultImage: images[index],
      autoplay: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final FullImagesArgumments args = ModalRoute.of(context).settings.arguments;
    print(args.images);
    print(args.index);
    return Scaffold(
        backgroundColor: Colors.black,
        body: Hero(tag: 'yla',child: _buildSlider(_mapToNetworkImages(args.images), args.index)));
  }
}
