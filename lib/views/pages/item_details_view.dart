import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/enums/attributes_enum.dart';
import 'package:gotit/presenters/comment_presenter.dart';
import 'package:gotit/services/validator_service.dart';
import 'package:gotit/views/widgets/comment.dart';
import 'package:gotit/views/widgets/empty_state.dart';
import 'package:gotit/views/widgets/item_details_card.dart';

class ItemDetailsPage extends StatefulWidget {
  final int id;
  final String userName;
  final String userImage;
  final String date;
  final List<String> images;
  final String content;
  final Map<Attributes, String> attributes;
  ItemDetailsPage({@required this.id, this.userName, this.userImage, this.date, this.images, this.content, this.attributes});

  @override
  State<StatefulWidget> createState() => ItemDetailsState();
}

class ItemDetailsState extends State<ItemDetailsPage> {
  final TextEditingController commentController = TextEditingController();
  CommentPresenter _commentPresenter = CommentPresenter();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      
    });
  }

  Widget buildComment(BuildContext context, int index) {
    if (_commentPresenter.comments.length > 0)
      return CommentView(
        index: index,
        date: _commentPresenter.comments[index].date,
        content: _commentPresenter.comments[index].content,
        picture: _commentPresenter.comments[index].user.picture,
        userName: _commentPresenter.comments[index].user.name,
      );
    else
      return EmptyState(
        message: 'There is no comments',
        image: 'assets/images/no_notifications.png'
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Item')),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: <Widget>[
            Card(
              elevation: 4.0,
              child: ItemDetailsCard(
                userName: widget.userName,
                userImage: widget.userImage,
                date: widget.date,
                images: widget.images,
                content: widget.content,
                attributes: widget.attributes
              )
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: buildComment,
              itemCount: _commentPresenter.comments.length,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Transform.translate(
        child: BottomAppBar(
          elevation: 4.0,
          color: Colors.transparent,
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: ListTile(
              title: TextFormField(
                controller: commentController,
                decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    labelText: "Write a comment....."),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
              trailing: IconButton(
                color: Theme.of(context).accentColor,
                icon: Icon(Icons.send),
                onPressed: () {
                  setState(() {
                    if (Validator.requiredField(commentController.text) == null) {
                      _commentPresenter.addComment(widget.id, commentController.text);
                      commentController.clear();
                    }
                  });
                }
              ),
            ),
          ),
        ),
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
      ),
    );
  }
}