import 'package:flutter/material.dart';
import 'package:gotit/Models/contact_us_model.dart';
import 'package:gotit/Presenters/contact_us_presenters.dart';

class ContactUsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactUs();
  }
}

class ContactUs extends State<ContactUsPage> {
  ContactPresenter contactPresenter = new ContactPresenter();
  TextEditingController email = new TextEditingController();
  TextEditingController subj = new TextEditingController();
  TextEditingController messag = new TextEditingController();
  ContactUsData contactUsData = new ContactUsData();
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Card(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                            // contact us , feedback and icon part
                            Material(
                                color: Color(0xff3b7585),
                                child: Row(children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'CONTACT US',
                                                style: TextStyle(
                                                    color: Colors.white60)),
                                            TextSpan(
                                                text: '\n\n Feedback',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15)),
                                          ],
                                        ),
                                      )),
                                  Container(
                                    width: 150,
                                  ),
                                  Icon(
                                    Icons.mail,
                                    color: Colors.white,
                                  ),
                                ])),
                            // Email textfield
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: TextField(
                                controller: email,
                                decoration: InputDecoration(
                                    hintText: "example@mail.com",
                                    labelText: "E-Mail",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0))),
                              ),
                            ),
                            // subject textfield
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: TextField(
                                controller: subj,
                                decoration: InputDecoration(
                                    labelText: "Subject",
                                    hintText: "Enter your subject",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0))),
                              ),
                            ),
                            // message textfield
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: TextField(
                                controller: messag,
                                textAlign: TextAlign.start,
                                textAlignVertical: TextAlignVertical.top,
                                decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    contentPadding: const EdgeInsets.only(
                                        top: 10, bottom: 100, left: 5),
                                    labelText: "Message",
                                    hintText: "Enter your Message...",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0))),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                // cancel button
                                Padding(
                                    padding: EdgeInsets.only(left: 180),
                                    child: new MaterialButton(
                                      height: 40.0,
                                      minWidth: 50.0,
                                      child: new Text(
                                        "CANCEL",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      onPressed: () => {
                                        // function when Cancel Pressed
                                      },
                                      splashColor: Colors.white70,
                                    )),
                                // OK button
                                new MaterialButton(
                                  height: 40.0,
                                  minWidth: 50.0,
                                  child: new Text(
                                    "OK",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  onPressed: () { 
                                    // function when Ok pressed
                                    contactUsData.email = email.text;
                                    contactUsData.subject = subj.text;
                                    contactUsData.message = messag.text;
                                  },
                                  splashColor: Colors.white70,
                                ),
                              ],
                            )
                          ]))
                    ]))));
  }
}
