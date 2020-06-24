import 'package:gotit/enums/age_stage_enum.dart';
import 'package:gotit/enums/gender_enum.dart';

class Person {
  int id;
  String name;
  AgeStage ageStage;
  Gender gender;

  Person({this.id, this.name, this.ageStage, this.gender});

  Person.fromJson(data) {
    id = data['id'];
    name = data['name'];
    ageStage = AgeStage.values[data['ageStage'] - 1];
    gender = Gender.values[data['gender'] - 1];
  }
  
}