import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/enums/attributes_enum.dart';
import 'package:gotit/helpers.dart';
import 'package:gotit/presenters/item_details_presenter.dart';
import 'package:gotit/services/validator_service.dart';
import 'package:gotit/views/widgets/chip.dart';
import 'package:gotit/views/widgets/comment.dart';
import 'package:gotit/views/widgets/empty_state.dart';
import 'package:gotit/views/widgets/images_slider.dart';
import 'package:timeago/timeago.dart' as timeago;

class ItemDetailsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ItemDetailsState();
}

class ItemDetailsState extends State<ItemDetailsPage> {
  final TextEditingController commentController = TextEditingController();
  int id = 0;
  ItemDetailsPresenter _itemDetailsPresenter = ItemDetailsPresenter();
  @override
  void initState() {
    super.initState();
    _itemDetailsPresenter.getInnerDetails();
    Future.delayed(Duration.zero, () {
      id = ModalRoute.of(context).settings.arguments;
    });
  }

  List<TagChip> mapAttriputes(Map<int, String> attributes) {
    return attributes.keys
        .map((int key) => TagChip(
              function: () => print('samo3aleko'),
              icon: Icon(Icons.gps_fixed),
              label: Text(Helpers.getStringFromEnum(Attributes.values[key]) +
                  ': ' +
                  attributes[key]),
            ))
        .toList();
  }

  List<AssetImage> mapImages(List<String> images) {
    return images.map((String image) => AssetImage(image)).toList();
  }

  Widget buildComment(BuildContext context, int index) {
    if (_itemDetailsPresenter.detailsModel.comments.length > 0)
      return CommentView(
        index: index,
        date: _itemDetailsPresenter.detailsModel.comments[index].date,
        content: _itemDetailsPresenter.detailsModel.comments[index].content,
        picture:
            _itemDetailsPresenter.detailsModel.comments[index].user.picture,
        userName: _itemDetailsPresenter.detailsModel.comments[index].user.name,
      );
    else
      return EmptyState(
          message: 'There is no comments',
          image: 'assets/images/no_notifications.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        print('hello');
                        _itemDetailsPresenter
                            .addComment(commentController.text);
                        commentController.clear();
                      }
                    });
                  }),
            ),
          ),
        ),
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
      ),
      appBar: AppBar(title: Text('Item')),
      body: GestureDetector(
        onTap: () {
          print('gesture detector tapped');
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: <Widget>[
            Card(
              elevation: 4.0,
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                          _itemDetailsPresenter.detailsModel.user.picture),
                    ),
                    title: Text(_itemDetailsPresenter.detailsModel.user.name),
                    subtitle: Text(timeago
                        .format(_itemDetailsPresenter.detailsModel.creationDate)
                        .toString()),
                  ),
                  ImageSlider(
                      mapImages(_itemDetailsPresenter.detailsModel.images)),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: (Text(
                      _itemDetailsPresenter.detailsModel.content,
                      style: TextStyle(fontSize: 18),
                    )),
                  ),
                  Wrap(
                    spacing: 3.0,
                    runSpacing: 3.0,
                    children: mapAttriputes(
                        _itemDetailsPresenter.detailsModel.attributes),
                  ),
                  Divider(),
                  MaterialButton(
                      color: Theme.of(context).accentColor,
                      elevation: 4.0,
                      animationDuration: Duration(milliseconds: 500),
                      hoverElevation: 10.0,
                      child: Text('I found This'),
                      onPressed: () => print('button tabbed')),
                  Divider()
                ],
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: buildComment,
              itemCount: _itemDetailsPresenter.detailsModel.comments.length,
            ),
          ],
        ),
      ),
    );
  }
}
