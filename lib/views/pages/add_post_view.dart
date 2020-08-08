import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/enums/item_type.dart';
import 'package:gotit/enums/lost_found_enum.dart';
import 'package:gotit/presenters/add_post_presenter.dart';
import 'package:gotit/services/validator_service.dart';
import 'package:gotit/views/item_attributes/item_attributes_map.dart';
import 'package:gotit/views/ui_elements/dropdown_element.dart';
import 'package:gotit/views/widgets/image_picker_dialog.dart';
import 'package:gotit/views/widgets/images_listview.dart';

import 'package:gotit/views/widgets/styled_material_buttom.dart';

import '../../helpers.dart';

class AddPost extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddPostState();
  }
}

class AddPostState extends State<AddPost> {
  List<GlobalKey<FormState>> _forms = List.generate(3, (int index) => GlobalKey<FormState>());
  int _currentStep = 0;
  AddPostPresenter _addPostPresenter = AddPostPresenter();
  ImagePickerDialog _imagePicker = ImagePickerDialog();
  List<String> images = [];
  void _addPhoto() async {
    if (_addPostPresenter.itemDetails.type == ItemType.object &&
        images.length >= 1) {
      print('dah object ya m3alem sora wa7da kfaya');
    } else {
      _imagePicker.getImage(context).then((String value) {
        if (value != null) {
          setState(() {
            images.add(value);
            print(images);
          });
        }
      });
    }
  }

  void removeImage(int index) {
    setState(() {
      _addPostPresenter.itemDetails.images.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
      ),
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.all(10),
        child: Stepper(
          currentStep: _currentStep,
          type: StepperType.horizontal,
          onStepContinue: () async {
            if(_currentStep == 0) {
              await _addPostPresenter.detectObjects();
            }
            if (_addPostPresenter.itemDetails.images.length == 0) return;
            if (_currentStep >= 2 || !_forms[_currentStep].currentState.validate()) return;
            _forms[_currentStep].currentState.save();
            setState(() {
              _currentStep += 1;
            });
            
          },
          onStepCancel: () {
            if (_currentStep <= 0) return;
            setState(() {
              _currentStep -= 1;
            });
          },
          steps: [
            Step(
              title: Text("Basic info"),
              content: Form(
                key: _forms[0],
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    DropdownElement(
                      validator: Validator.requiredField,
                      icon: Icon(Icons.arrow_drop_down),
                      onSaved: (String value) {
                        value == 'lost'
                            ? _addPostPresenter
                                .itemDetails.isLost = true
                            : _addPostPresenter
                                .itemDetails.isLost = false;
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
                        _addPostPresenter.itemDetails.type =
                            Helpers.getEnumFromString(ItemType.values, value);
                      },
                      items: Helpers.getListOfStringsFromEnum(ItemType.values),
                      decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: 'Is it an object or a person'),
                    ),
                    StyledButton(
                        onpress: _addPhoto,
                        icon: Icon(Icons.photo),
                        text: Text('Add Photo')),
                    ImagesListView(images, removeImage),
                  ],
                ),
              ),
            ),
            Step(
              title: Text("Attributes"),
              content:Form(
               key:_forms[1],
               child: ItemAttributes.widget['car']),
            ),
            Step(
              title: Text("Content"),
              content:  Form(
                key: _forms[2],
                child: TextFormField(
                  onSaved: (String value) => _addPostPresenter
                      .itemDetails.content = value,
                  decoration: InputDecoration(
                      icon: Icon(Icons.message),
                      labelText: "Write about your item"),
                  maxLines: 10,
                  keyboardType: TextInputType.multiline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    
  }
}
