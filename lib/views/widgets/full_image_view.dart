import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/arguments/full_view_images_arguments.dart';
import 'package:gotit/views/widgets/images_slider.dart';

class FullImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FullImagesArgumments args = ModalRoute.of(context).settings.arguments;
    print(args.images);
    print(args.index);
    return Scaffold(
        backgroundColor: Colors.black,
        body: Hero(tag: 'yla', child: ImageSlider(images: args.images, isFullScreen: true, initIndex: args.index)));
  }
}
