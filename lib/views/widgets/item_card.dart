import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/enums/attributes_enum.dart';
import 'package:gotit/helpers.dart';
import 'package:gotit/views/pages/item_details_view.dart';
import 'package:gotit/views/ui_elements/cached_image_element.dart';

class ItemCard extends StatelessWidget {
  final String userName;
  final String userImage;
  final String date;
  final List<String> images;
  final String content;
  final int id;
  final Map<Attributes, String> attributes;
  final bool isFirst;

  ItemCard({@required this.id,this.userName, this.userImage, this.date, 
    this.images, this.content, this.attributes, this.isFirst});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isFirst ? EdgeInsets.only(top: 15, bottom: 15) : EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => ItemDetailsPage(
              id: id,
              userImage: userImage,
              userName: userName,
              attributes: attributes,
              content: content,
              date: date,
              images: images,
            )
          ));
        },
        child: Card(
          margin: EdgeInsets.only(),
          child: Column(
            children: [
              ListTile(
                //title and subhead
                title: Text(userName),
                subtitle: Text(date),
                //profile icon
                leading: CircleAvatar(
                  backgroundImage: CachedImage.provider(userImage)
                )
              ),
              //image of the item itself
              Container(
                height: 200,
                child: SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: CachedImage(images.first, fit: BoxFit.cover)
                )
              ),
              //description of the item
              Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  Helpers.truncateWithEllipsis(content, 90),
                  style: TextStyle(fontSize: 18)
                )
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          )
        )
      ),
    );
  }
}
