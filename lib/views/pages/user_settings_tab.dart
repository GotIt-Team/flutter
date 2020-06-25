import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/views/widgets/user_general_settings.dart';
import 'package:gotit/views/widgets/user_security_settings.dart';

class UserSettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30 ,bottom: 30),
            child: UserGeneralSettings(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: UserSecuritySettings(),
          )
        ]
      )
    );
  }
  
}