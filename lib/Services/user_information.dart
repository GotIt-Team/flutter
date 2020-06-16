import 'package:gotit/Models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
ViewModel _userModel = new ViewModel();
 var data = {"Name":_userModel.Name,"Email":_userModel.Email,"Password":_userModel.Password1,
   "PhoneNumber":_userModel.PhoneNumber,"City":_userModel.Address,"Gender":_userModel.Gender};

 var dataLogin = {"Email":_userModel.Email,"Password":_userModel.Password1};

 final Map<String, String> headers = <String, String>{'Content-type': 'application/json'};

 Future SendUserData() async{
   var url = "server url";
   var response = await  http.post(url,headers: headers,body: data);
   if (response.statusCode == 200) {
     var jsonResponse = convert.jsonDecode(response.body);
     print('good http request');
   } else {
     print('Request failed with status: ${response.statusCode}.');
   }


 }

 Future SendUserDataLogin() async{
  var url = "server url";
  var response = await  http.post(url,headers: headers,body: dataLogin);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    print(' Login Done');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }


}