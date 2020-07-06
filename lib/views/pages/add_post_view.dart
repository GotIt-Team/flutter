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
import 'package:gotit/views/widgets/image_picker_dialog.dart';
import 'package:gotit/views/widgets/images_listview.dart';
import 'package:gotit/views/widgets/styled_material_buttom.dart';

class AddPostView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddPostViewState();
  }
}

class _AddPostViewState extends State<AddPostView> {
  ImagePickerDialog _imagePicker = ImagePickerDialog();
  List<String> images = [];
  String type;
  String age;
  String gender;
  String brand;
  String serial;
  Widget fieldsBelow = Container();
  AddPostPresenter _postPresenter = new AddPostPresenter();
  GlobalKey<FormState> _personAttributesFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _addPostFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _objectAttributesFormKey = GlobalKey<FormState>();
  void _addPhoto () async{
    if (type == Helpers.getStringFromEnum(ItemType.object) &&
        images.length >= 1) {
      print('dah object ya m3alem sora wa7da kfaya');
    } else {
      _imagePicker.getImage(context).then((String value) {
        if(value !=null){
        
        setState(() {
          images.add(value);
          print(images);
        });}
      });
    }
  }
  void removeImage(int index){
    setState(() {
    images.removeAt(index);
      
    });

  }
  Widget _buildObjectAttributesForm() {
    return Form(
      key: _objectAttributesFormKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                icon: Icon(Icons.calendar_today),
                labelText: 'Serial numper',
                hintText: 'Serial numper',
              ),
              onSaved: (String value) => serial = value,
            ),
            SizedBox(height: 10),
            DropdownElement(
              icon: Icon(Icons.arrow_drop_down_circle),
              onSaved: (String value) {
                brand = value;
              },
              items: Helpers.getListOfStringsFromEnum(ObjectBrands.values),
              decoration: InputDecoration(
                  icon: Icon(Icons.phone_android), labelText: 'Brand'),
            ),
            SizedBox(height: 10),
            StyledButton(
                onpress: _addPhoto,
                icon: Icon(Icons.photo),
                text: Text('Add Photo'))
          ]),
    );
  }

  Widget _buildPersonAttributesForm() {
    return Form(
      key: _personAttributesFormKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                icon: Icon(Icons.calendar_today),
                labelText: 'Age',
                hintText: 'Age',
              ),
              validator: Validator.numberField,
              onSaved: (String value) => age = value,
            ),
            SizedBox(height: 10),
            DropdownElement(
              validator: (String value) => Validator.requiredField(value),
              icon: Icon(Icons.arrow_drop_down_circle),
              onSaved: (String value) {
                gender = value;
              },
              items: Helpers.getListOfStringsFromEnum(Gender.values),
              decoration:
                  InputDecoration(icon: Icon(Icons.face), labelText: 'Gender'),
            ),
            StyledButton(
                onpress: _addPhoto,
                icon: Icon(Icons.photo),
                text: Text('Add Photo'))
          ]),
    );
  }

  void _submitAddPostForm(BuildContext context, DialogResult dialogResult) {
    if (dialogResult == DialogResult.submit) {
      if (_addPostFormKey.currentState.validate()) {
        print('validated ya sa7by');
        _addPostFormKey.currentState.save();
        print(_postPresenter.addPostModel.itemDetails.isLost);
        print(_postPresenter.addPostModel.itemDetails.type);
        print(_postPresenter.addPostModel.itemDetails.content);
        print('l attributes mn lform l kbera');
        print(_postPresenter.addPostModel.itemDetails.attributes);

        if (_postPresenter.addPostModel.itemDetails.type == ItemType.object) {
          if (_objectAttributesFormKey.currentState.validate()) {
            _objectAttributesFormKey.currentState.save();
            _postPresenter.addPostModel.itemDetails.attributes = {
              Attributes.brand: brand,
              Attributes.serial: serial
            };
            print(_postPresenter.addPostModel.itemDetails.attributes);

            //send data request
          }
        } else if (_postPresenter.addPostModel.itemDetails.type ==
            ItemType.person) {
          print('ana person');
          if (_personAttributesFormKey.currentState.validate()) {
            _personAttributesFormKey.currentState.save();
            _postPresenter.addPostModel.itemDetails.attributes = {
              Attributes.gender: gender,
              Attributes.ageStage: age
            };
            print(_postPresenter.addPostModel.itemDetails.attributes);
            //send data request
          }
        }
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
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Form(
                  key: _addPostFormKey,
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      TextFormField(
                        onSaved: (String value) => _postPresenter
                            .addPostModel.itemDetails.content = value,
                        decoration: InputDecoration(
                            icon: Icon(Icons.message),
                            labelText: "Write about your item"),
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DropdownElement(
                        validator: Validator.requiredField,
                        icon: Icon(Icons.arrow_drop_down),
                        onSaved: (String value) {
                          value == 'lost'
                              ? _postPresenter.addPostModel.itemDetails.isLost =
                                  true
                              : _postPresenter.addPostModel.itemDetails.isLost =
                                  false;
                        },
                        items: Helpers.getListOfStringsFromEnum(
                            LostOrFound.values),
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
                        items:
                            Helpers.getListOfStringsFromEnum(ItemType.values),
                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: 'Is it an object or a person'),
                        onChanged: (String value) {
                          images.clear();
                          value == 'person'
                              ? setState(() {
                                  fieldsBelow = _buildPersonAttributesForm();
                                  type = value;
                                })
                              : value == 'object'
                                  ? setState(() {
                                      fieldsBelow =
                                          _buildObjectAttributesForm();
                                      type = value;
                                    })
                                  : print('samo3aleko');
                        },
                      ),
                      SizedBox(height: 10),
                      fieldsBelow,ImagesListView(images,removeImage)
                    ],
                  ),
                ),
              ],
            ),
          ),
          context: context,
          title: Text('Add post form'),
        ));
  }
}
