import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/enums/dialog_buttons_enum.dart';
import 'package:gotit/enums/item_type.dart';
import 'package:gotit/enums/lost_found_enum.dart';
import 'package:gotit/presenters/add_post_presenter.dart';
import 'package:gotit/services/state_message_service.dart';
import 'package:gotit/services/validator_service.dart';
import 'package:gotit/views/item_attributes/item_attributes_map.dart';
import 'package:gotit/views/ui_elements/dropdown_element.dart';
import 'package:gotit/views/widgets/alert_dialog.dart';
import 'package:gotit/views/widgets/image_picker_dialog.dart';
import 'package:gotit/views/widgets/images_listview.dart';
import 'package:gotit/views/widgets/progress_dialog.dart';

import 'package:gotit/views/widgets/styled_material_buttom.dart';

import 'package:gotit/helpers.dart';

class AddItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddItemState();
  }
}

class AddItemState extends State<AddItem> {
  List<GlobalKey<FormState>> _forms = List.generate(3, (int index) => GlobalKey<FormState>());
  int _currentStep = 0;
  String option;
  AddPostPresenter _addPostPresenter = AddPostPresenter();
  ImagePickerDialog _imagePicker = ImagePickerDialog();
  List<String> images = [];
  void _addPhoto() async {
    _imagePicker.getImage(context).then((String value) {
      if (value != null) {
        setState(() {
          _addPostPresenter.itemDetails.images.add(value);
          print(images);
        });
      }
    });
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
          controlsBuilder: (context, {onStepContinue, onStepCancel}) => ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Text('Next'),
                onPressed: onStepContinue,
              ),
              FlatButton(
                child: Text('Previous'),
                onPressed: onStepCancel,
              )
            ]
          ),
          onStepContinue: () async {
            if (!_forms[_currentStep].currentState.validate()) return;
            if(_currentStep == 2) {
              await ProgressDialog.show(
                context: context,
                isCircular: false,
                method: () => Future.delayed(Duration(seconds: 3))
              );
              await DialogBox.show(
                context: context,
                title: Text('Done'),
                content: Column(
                  children: <Widget>[
                    Text(
                      'Your Item has been add',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center
                    ),
                    Text(
                      'Once Our Matching engine find this item we will send a notification',
                      style: TextStyle(
                        fontSize: 18
                      ),
                      textAlign: TextAlign.center
                    ),
                  ],
                ),
                dialogButton: DialogButtons.ok
              );
              Navigator.pushReplacementNamed(context, '/home');
              return;
            }
            _forms[_currentStep].currentState.save();
            if (_addPostPresenter.itemDetails.images.length == 0) return;
            if(_currentStep == 0) {
              await _addPostPresenter.detectObjects(context);
            }
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
                      value: option,
                      onSaved: (String value) {
                        option = value;
                        _addPostPresenter.itemDetails.isLost = 
                          value == 'lost' ? true : false;
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
                    ImagesListView(_addPostPresenter.itemDetails.images, removeImage),
                  ],
                ),
              ),
            ),
            Step(
              title: Text("Attributes"),
              content:Form(
               key:_forms[1],
               child: _addPostPresenter.itemDetails.type == ItemType.person ? ItemAttributes.widget['person'] : ItemAttributes.widget['laptop']
              ),
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
