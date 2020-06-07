//user's services class
import 'package:http/http.dart' as http;

abstract class UserService{
  http.Response fetch();
}

class Habd implements UserService{
  @override
  http.Response fetch() {
    http.get('http://dummy.restapiexample.com/api/v1/employees')
    .then((value){
      return value;
    }).catchError((error){
      print(error);
      throw error;
    });
  }
  
}