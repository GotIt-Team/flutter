import 'package:flutter/material.dart';
import 'package:gotit/models/contact_us_model.dart';
import 'package:gotit/models/result_model.dart';
import 'package:gotit/services/http_service.dart';
import 'package:gotit/views/widgets/progress_dialog.dart';

class ContactUsPresenter {
  ContactUs _model = ContactUs();
  Result<bool> result;

  ContactUs get model {
    return _model;
  }  

  void setMessage(String message) {
    _model.message = message;
  }

  void setSubject(String subject) {
    _model.subject = subject;
  }

  void setEmail(String email) {
    _model.email = email;
  }

  Future<void> _sendEmail() async{
    result = await Http.send(
      endpointUrl: 'system/contact-us',
      body: _model,
      method: 'POST'
    );
  }

  Future<void> sendEmail(BuildContext context) async {
    await ProgressDialog.show(
      context: context,
      isCircular: false,
      method: () => _sendEmail()
    );
  }
}
