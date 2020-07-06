import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String image;
  final BoxFit fit;
  final Widget errorWidget;
  CachedImage(this.image, {this.fit, this.errorWidget});

  static provider(String image) {
    try {
      return NetworkImage(image);
    }catch (e) {
      return AssetImage('assets/images/user.jpg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => errorWidget ?? Icon(Icons.error),
      fit: fit,
      colorBlendMode: BlendMode.dstATop,
    );
  }
  
}