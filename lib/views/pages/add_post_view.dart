import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/enums/dialog_buttons_enum.dart';
import 'package:gotit/enums/lost_found_enum.dart';
import 'package:gotit/helpers.dart';
import 'package:gotit/presenters/add_post_presenter.dart';
import 'package:gotit/services/validator_service.dart';
import 'package:gotit/views/ui_elements/dropdown_element.dart';
import 'package:gotit/views/widgets/alert_dialog.dart';

class AddPostView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddPostViewState();
  }
}

class AddPostViewState extends State<AddPostView> {
  AddPostPresenter _postPresenter = new AddPostPresenter();
  GlobalKey<FormState> _addPostFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add post'),
        ),
        body: DialogBox.dialog(dialogButton:DialogButtons.submit ,isPopup: true,
          content: Container(
            padding: EdgeInsets.all(10),
            child: Form(
                key: _addPostFormKey,
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    DropdownElement(
                     validator: Validator.requiredField,
                      icon: Icon(Icons.arrow_drop_down),
                      onSaved: (String value){value=='lost'?_postPresenter.addPostModel.itemDetails.isLost=false:_postPresenter.addPostModel.itemDetails.isLost=true;},
                      items: Helpers.getListOfStringsFromEnum(LostOrFound.values),
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: 'Item type'
                      ),
                    )
                  ],
                )),
          ),
          context: context,
          title: Text('Add post form'),
        ));
  }
}
