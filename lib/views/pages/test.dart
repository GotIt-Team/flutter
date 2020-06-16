import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class httpWidget extends StatefulWidget{
  State<StatefulWidget>createState()=>httpState();
}

class httpState extends State<httpWidget>{
  Future getDataFromAPI()async{
    var url="https://jsonplaceholder.typicode.com/posts";
    var response = await http.get(url);
    var reponsebody = convert.jsonDecode(response.body);
    print(reponsebody);
  }
  @override
  void initState() {
    // TODO: implement initState
    getDataFromAPI();
    super.initState();
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Text('Hello HTTP'),
    );
  }
}