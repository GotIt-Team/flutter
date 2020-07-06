import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/enums/attributes_enum.dart';
import 'package:gotit/helpers.dart';
import 'package:gotit/views/ui_elements/expand_text.dart';
import 'package:gotit/views/widgets/chip.dart';
import 'package:gotit/views/widgets/images_slider.dart';

class ItemDetailsCard extends StatelessWidget {
  final String userName;
  final String userImage;
  final String date;
  final List<String> images;
  final String content;
  final Map<Attributes, String> attributes;
  ItemDetailsCard({this.userName, this.userImage, this.date, this.images, this.content, this.attributes});
  
  List<TagChip> _mapAttriputes(Map<Attributes, String> attributes) {
    return attributes.keys
      .map((Attributes key) => TagChip(
        function: () => print('samo3aleko'),
        icon: Icon(Icons.gps_fixed),
        label: Text(Helpers.getStringFromEnum(key) +
          ': ' +
          attributes[key]),
      )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(userImage),
          ),
          title: Text(userName),
          subtitle: Text(date),
        ),
        ImageSlider(
          images: images,
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: ExpandText(
            content,
            style: TextStyle(fontSize: 18),
          ),
        ),
        Wrap(
          spacing: 3.0,
          runSpacing: 3.0,
          children: _mapAttriputes(attributes),
        )
      ],
    );
  }
  
}