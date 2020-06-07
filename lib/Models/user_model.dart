//every user should have a service class to handle its data from the api
//or we may use a generic repository
class UserModel{
  String _name;
  int _age;

  set name(String name){
    this._name = name;
  }

  set age(int age){
    this._age = age;
  }

  String get name{
    return _name;
  }

  int get age{
    return _age;
  }
}