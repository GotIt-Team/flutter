import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/enums/attributes_enum.dart';
import 'package:gotit/enums/dialog_buttons_enum.dart';
import 'package:gotit/enums/dialog_result_enum.dart';
import 'package:gotit/enums/gender_enum.dart';
import 'package:gotit/enums/item_type.dart';
import 'package:gotit/enums/lost_found_enum.dart';
import 'package:gotit/enums/object_brands.dart';
import 'package:gotit/helpers.dart';
import 'package:gotit/presenters/add_post_presenter.dart';
import 'package:gotit/services/validator_service.dart';
import 'package:gotit/views/ui_elements/dropdown_element.dart';
import 'package:gotit/views/widgets/alert_dialog.dart';

class AddPostView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddPostViewState();
  }
}

class _AddPostViewState extends State<AddPostView> {
  TextEditingController _serialFieldController=TextEditingController();
  List<Widget> fieldsBelow = [];
  Widget brandTextField = SizedBox(
    height: 1,
  );
  AddPostPresenter _postPresenter = new AddPostPresenter();

  GlobalKey<FormState> _addPostFormKey = GlobalKey<FormState>();
  Widget _buildBrandTextField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: Icon(Icons.branding_watermark),
        labelText: 'if your bran',
        hintText: 'write your brand',
      ),
      onSaved: (String value) =>
          _postPresenter.addPostModel.itemDetails.attributes[1] = value,
    );
  }

  List<Widget> _buildObjectAttributesWidgets() {
    return [
      TextFormField(
        controller: _serialFieldController,

        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          icon: Icon(Icons.calendar_today),
          labelText: 'Serial numper',
          hintText: 'Serial numper',
        ),
        onSaved: (String value) =>
            _postPresenter.addPostModel.itemDetails.attributes[2] = value,
      ),
      SizedBox(height: 10),
      DropdownElement(
        icon: Icon(Icons.arrow_drop_down_circle),
        onSaved: (String value) {
          _postPresenter.addPostModel.itemDetails.attributes[1] = value;
        },
        onChanged: (String value) {
          print(value);
          if (value == 'neither'){
            setState(() {
              brandTextField = _buildBrandTextField();
            });
        }},
        items: Helpers.getListOfStringsFromEnum(ObjectBrands.values),
        decoration: InputDecoration(
            icon: Icon(Icons.phone_android), labelText: 'Brand'),
      ),
      SizedBox(height: 10),
      brandTextField
    ];
  }

  List<Widget> _buildPersonAttributesWidgets() {
    return [
      TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          icon: Icon(Icons.calendar_today),
          labelText: 'Age',
          hintText: 'Age',
        ),
        validator: Validator.numberField,
        onSaved: (String value) =>
            _postPresenter.addPostModel.itemDetails.attributes[4] = value,
      ),
      SizedBox(height: 10),
      DropdownElement(
        validator: (String value) => Validator.requiredField(value),
        icon: Icon(Icons.arrow_drop_down_circle),
        onSaved: (String value) {
          _postPresenter.addPostModel.itemDetails.attributes[5] = value;
        },
        items: Helpers.getListOfStringsFromEnum(Gender.values),
        decoration:
            InputDecoration(icon: Icon(Icons.face), labelText: 'Gender'),
      )
    ];
  }

  void _submitAddPostForm(BuildContext context, DialogResult dialogResult) {
    if (dialogResult == DialogResult.submit) {
      if (_addPostFormKey.currentState.validate()) {
        print('validated ya sa7by');
        _addPostFormKey.currentState.save();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add post'),
        ),
        body: DialogBox.dialog(
          onPress: (DialogResult dialogResult) =>
              _submitAddPostForm(context, dialogResult),
          dialogButton: DialogButtons.submit,
          isPopup: false,
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
                      onSaved: (String value) {
                        value == 'lost'
                            ? _postPresenter.addPostModel.itemDetails.isLost =
                                false
                            : _postPresenter.addPostModel.itemDetails.isLost =
                                true;
                      },
                      items:
                          Helpers.getListOfStringsFromEnum(LostOrFound.values),
                      decoration: InputDecoration(
                          icon: Icon(Icons.person), labelText: 'Item type'),
                    ),
                    SizedBox(height: 10),
                    DropdownElement(
                      validator: Validator.requiredField,
                      icon: Icon(Icons.arrow_drop_down),
                      onSaved: (String value) {
                        _postPresenter.addPostModel.itemDetails.type =
                            Helpers.getEnumFromString(ItemType.values, value);
                      },
                      items: Helpers.getListOfStringsFromEnum(ItemType.values),
                      decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: 'Is it an object or a person'),
                      onChanged: (String value) {
                        value == 'person'
                            ? setState(() {
                              fieldsBelow.clear();
                              _serialFieldController.clear();
                                fieldsBelow = _buildPersonAttributesWidgets();
                              })
                            : value == 'object'
                                ? setState(() {
                                  fieldsBelow.clear();
                                    fieldsBelow =
                                        _buildObjectAttributesWidgets();
                                  })
                                : print('samo3aleko');
                      },
                    ),
                    SizedBox(height: 10),
                    ...fieldsBelow
                  ],
                )),
          ),
          context: context,
          title: Text('Add post form'),
        ));
  }
}
