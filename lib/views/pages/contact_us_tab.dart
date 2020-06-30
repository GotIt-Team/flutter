import 'package:flutter/material.dart';
import 'package:gotit/enums/result_message_enum.dart';
import 'package:gotit/helpers.dart';
import 'package:gotit/presenters/contact_us_presenters.dart';
import 'package:gotit/enums/dialog_buttons_enum.dart';
import 'package:gotit/enums/dialog_result_enum.dart';
import 'package:gotit/services/state_message_service.dart';
import 'package:gotit/services/validator_service.dart';
import 'package:gotit/views/widgets/alert_dialog.dart';

class ContactUsTab extends StatelessWidget {
  final ContactUsPresenter _contactUsPresenter = ContactUsPresenter();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void _sendEmail(BuildContext context, DialogResult result) async {
    if(result == DialogResult.ok) {
      if(formkey.currentState.validate()){
        formkey.currentState.save();
        await _contactUsPresenter.sendEmail(context);
        var flag = !_contactUsPresenter.result.isSucceeded || !_contactUsPresenter.result.data;
        var resultMessage = Helpers.getEnumFromString(ResultMessage.values, _contactUsPresenter.result.message);
        DialogBox.show(
          context: context, 
          title: Text(flag ? 'Error' : 'Done'),
          content: Text(
            StateMessage.get(resultMessage),
            style: TextStyle(
              fontSize: 20
            ),
            textAlign: TextAlign.center
          ),
          dialogButton: DialogButtons.ok
        ).then((value) {
          formkey.currentState.reset();
        });
      }
    } else {
      formkey.currentState.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DialogBox.dialog(
      context: context,
      title: ListTile(
        title: Text(
          'CONTACT US',
          style: TextStyle(
            color: Theme.of(context).textTheme.title.color,
            fontSize: 22
          )
        ),
        trailing: Icon(
          Icons.mail,
          color: Theme.of(context).iconTheme.color,
        )
      ),
      content: Form(
        key: formkey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: ('example@email.com'),
                ),
                validator: Validator.emailField,
                onSaved: _contactUsPresenter.setEmail
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Subject',
                  hintText: ('Enter Subject'),
                ),
                validator: Validator.requiredField,
                onSaved: _contactUsPresenter.setSubject
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: 'Message',
                  hintText: ('Enter Your Message ...')
                ),
                maxLines: 8,
                maxLength: 1000,
                validator: Validator.requiredField,
                onSaved: _contactUsPresenter.setMessage
              ),
            )
          ],
        ),
      ),
      dialogButton: DialogButtons.ok_cancel,
      onPress: (DialogResult result) => _sendEmail(context, result)
    );
  }
}
