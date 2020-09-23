import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/services/shared_preferences_service.dart';
import 'package:gotit/views/ui_elements/rounded_buton_element.dart';
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 30),
            child: RoundedButton(
              label: 'Log out',
              onPressed: () async {
                await SharedPreference.clear();
                Navigator.pushReplacementNamed(context, '/landing');
                return;
              },
            ),
          )
        ]
      )
    );
  }
  
}