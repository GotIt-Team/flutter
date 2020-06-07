//every view should have a presenter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVP'),
      ),
      body: Form(
        child: Column(
          children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Name',
              icon: Icon(Icons.title),
            ),
          ),
          SizedBox(height:10.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Age',
              icon: Icon(Icons.accessibility),
            ),
          ),
          SizedBox(height:10.0),
          FlatButton(onPressed: (){}, child: Text("Submit"))
        ]),
      ),
    );
  }
}
