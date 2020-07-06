import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gotit/enums/dialog_buttons_enum.dart';
import 'package:gotit/enums/dialog_result_enum.dart';
import 'package:gotit/enums/result_message_enum.dart';
import 'package:gotit/helpers.dart';
import 'package:gotit/presenters/item_presenter.dart';
import 'package:gotit/services/state_message_service.dart';
import 'package:gotit/views/widgets/alert_dialog.dart';
import 'package:gotit/views/widgets/empty_state.dart';
import 'package:gotit/views/widgets/item_details_card.dart';
import 'package:gotit/views/widgets/progress_dialog.dart';
import 'package:timeago/timeago.dart' as timeago;

class MatchInformationPage  extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MatchInformationState();
  
}

class MatchInformationState extends State<MatchInformationPage> {
  ItemPresenter itemPresenter = ItemPresenter();
  int id;
  bool loaded = false;

  Future<void> error() async {
    if(context == null) return;
    var resultMessage = Helpers.getEnumFromString(ResultMessage.values, itemPresenter.message);
    DialogBox.show(
      context: context, 
      title: Text('Error'),
      content: Text(
        StateMessage.get(resultMessage),
        style: TextStyle(
          fontSize: 20
        ),
        textAlign: TextAlign.center
      ),
      dialogButton: DialogButtons.ok
    );
  }

  Future<void> _loadMatchedItem() async {
    if(context == null) return;
    id = ModalRoute.of(context).settings.arguments;
    ProgressDialog.show(
      context: context,
      isCircular: false,
      method: () =>  itemPresenter.getItemDetails(id).then((value) {
        if(!mounted) return;
        if(itemPresenter.itemDetails == null) {
          error();
          return;
        } 
        setState(() {
          loaded = true;
        });
      })
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _loadMatchedItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match'),
      ),
      body: loaded ? Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: DialogBox.dialog(
          context: context,
          title: Text('Is this your item ?'),
          padding: EdgeInsets.zero,
          content: ItemDetailsCard(
            userImage: itemPresenter.itemDetails.user.picture,
            userName: itemPresenter.itemDetails.user.name,
            images: itemPresenter.itemDetails.images,
            content: itemPresenter.itemDetails.content,
            attributes: itemPresenter.itemDetails.attributes,
            date: timeago.format(itemPresenter.itemDetails.creationDate),
          ),
          dialogButton: DialogButtons.yes_no,
          onPress: (result) {
            if (result == DialogResult.no) {

            } else {
              
            }
          }
        ),
      ) : EmptyState(
        image: 'assets/images/no_items.png',
        message: 'Item doesn\'t exists',
      ),
    );
  }

}