import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/models/user_token_model.dart';
import 'package:gotit/services/http_service.dart';

class Notifications extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        child: Text('click'),
        onPressed: () async {
          var x = await Http.send<UserToken>(
            endpointUrl: 'user/sign-in',
            method: "POST",
            body: {
              'email': 'asmaakhaled603@gmail.com',
              'password': '123456789'
            },
            mapper: (data) => UserToken.fromJson(data)
          );
          print(x.data.token);
        },
      )
    );
  }
}