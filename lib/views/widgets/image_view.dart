import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/arguments/full_view_images_arguments.dart';

class ImageView extends StatelessWidget {
  final List<String> _images;
  final int index;
  final Function removeImage;
  ImageView(this._images, this.index, this.removeImage);
  DecorationImage _buildDecorationImage(String image) {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.dstATop),
      image: NetworkImage(image),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        '/full-image',
        arguments: FullImagesArgumments(index: index, images: _images),
      ),
      child: Container(
        alignment: Alignment.topRight,
        height: MediaQuery.of(context).size.height * .2,
        width: MediaQuery.of(context).size.width * .2,
        decoration: BoxDecoration(
          image: _buildDecorationImage(_images[index]),
        ),
        child: IconButton(
          icon: Icon(Icons.delete_outline),
          onPressed: () => removeImage(index),
        ),
      ),
    );
  }
}
