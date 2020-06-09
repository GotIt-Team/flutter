//every view should have a presenter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/AppTheme.dart';
import '../../Presenters/user_profile_presenter.dart';

class HomePage extends StatefulWidget {
  final HomePresenter _homePresenter = HomePresenter();
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  bool dark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVP'),
      ),
      body: Form(
        key: widget._homePresenter.key,
        child: Column(
          children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Name',
              icon: Icon(Icons.title),
            ),
            onSaved: widget._homePresenter.name,
            validator: widget._homePresenter.validateName,
          ),
          SizedBox(height:10.0),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Age',
              icon: Icon(Icons.accessibility),
            ),
            onSaved: widget._homePresenter.age,
            validator: widget._homePresenter.validateAge,
          ),
          SizedBox(height:10.0),
          FlatButton(onPressed: (){
            dark = !dark;
            AppTheme.switchTheme(dark);
          }, child: Text("Submit")),
          Switch(value: true, 
            onChanged: (value){
              AppTheme.switchTheme(value);
            })
        ]),
      ),
    );
  }
}
