import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/helpers.dart';
import 'package:intl/intl.dart';

class ItemCard extends StatelessWidget {
  final String userName;
  final String userImage;
  final DateTime creationDate;
  final String image;
  final String content;
  final int id;
  final bool isFirst;

  ItemCard({@required this.id,this.userName, this.userImage, this.creationDate, this.image, this.content, this.isFirst});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isFirst ? EdgeInsets.only(top: 15, bottom: 15) : EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/item-details', arguments: id);
        },
        child: Card(
          margin: EdgeInsets.only(),
          child: Column(
            children: [
              ListTile(
                //title and subhead
                title: Text(userName),
                subtitle: Text(DateFormat().format(creationDate)),
                //profile icon
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Sheka.jpg'),
                )
              ),
              //image of the item itself
              Container(
                height: 200,
                child: SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Image(
                    image: AssetImage('assets/images/Sheka.jpg')
                  ),
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
