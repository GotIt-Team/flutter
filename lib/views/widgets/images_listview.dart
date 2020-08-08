import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/views/widgets/image_view.dart';

class ImagesListView extends StatelessWidget {
  final List<String> _images;
  final Function removeImage;
  ImagesListView(this._images,this.removeImage);
  @override
  Widget build(BuildContext context) {
    return _images.length > 0
        ? Container(
          height: MediaQuery.of(context).size.height * .1,
          width: MediaQuery.of(context).size.width*.5*3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ImageView(_images,index,removeImage);
              },
              itemCount: _images.length,
            ),
        )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('No photos added yet'),
              Icon(Icons.photo_album,color: Theme.of(context).appBarTheme.color,)
            ],
          );
  }
}
