import 'package:flutter/material.dart';
import 'package:gotit/Services/validator_service.dart';
import 'package:gotit/views/ui_elements/dropdown_element.dart';
import 'package:gotit/views/widgets/alert_dialog.dart';
import 'package:gotit/enums/dialog_result_enum.dart';
import 'package:gotit/enums/dialog_buttons_enum.dart';
import 'package:gotit/Presenters/orgainzation_request_presenter.dart';
import 'package:gotit/services/validator_service.dart';

// ignore: must_be_immutable
class OrganizationRequestPage extends StatelessWidget {
  OrganizationRequestPresenter organizationRequestPresenter =
      OrganizationRequestPresenter();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  List organization = ["Nursing Home", "orphanage", "Hospitals"];
  _login(BuildContext context, DialogResult result) {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: DialogBox.dialog(
            context: context,
            title: Text('Organization Request'),
            content: Container(
              padding: EdgeInsets.all(10),
              child: Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: DropdownElement(
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: 'Organization',
                          hintText: 'Select Organization Type',
                        ),
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        onSaved: (value) {
                          organizationRequestPresenter.setTitle(value);
                        },
                        onChanged: (value) {},
                        items:
                            organization.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.people),
                          labelText: 'organization Name',
                          hintText: 'Enter organization name',
                        ),
                        //validator: Validator.requiredField,
                        onSaved:
                            organizationRequestPresenter.setNameOrganization,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.email),
                          labelText: 'organization Email',
                          hintText: 'Enter organization Email',
                        ),
                        //validator: Validator.requiredField,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.insert_link),
                          labelText: 'Post Link',
                          hintText:
                              'Please Enter link of post that it is related to this above  message ',
                        ),
                        //validator: Validator.requiredField,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: TextFormField(
                        maxLines: 10,
                        decoration: InputDecoration(
                          icon: Icon(Icons.message),
                          labelText: 'Message Content',
                          hintText: 'Enter Content of message',
                        ),
                        //validator: Validator.requiredField,
                        onSaved: organizationRequestPresenter.setMessageContent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            dialogButton: DialogButtons.ok_cancel,
            onPress: (DialogResult result) => _login(context, result)));
  }
}
