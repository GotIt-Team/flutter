import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String userName;
  final String userImage;
  final String creationDate;
  final String image;
  final String content;
  final int id;

  ItemCard({@required this.id,this.userName, this.userImage, this.creationDate, this.image, this.content});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/item/' +id.toString());
        //the function of clicked item
      },
      child: Card(
        child: Column(
          children: [
            ListTile(
              //title and subhead
              title: Text(userName),
              subtitle: Text(creationDate),
              //profile icon
              leading: CircleAvatar(
                backgroundImage: AssetImage(userImage),
              )
            ),
            //image of the item itself
            Container(
              padding: const EdgeInsets.only(right: 5, left: 5),
              child: Image.asset(
                image,
                height: 150,
                width: 350,
                fit: BoxFit.fill,
              ),
            ),
            //description of the item
            Container(
              padding: EdgeInsets.all(5),
              child: Text(content))
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        )
      )
    );
  }
}
