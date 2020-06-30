import 'package:gotit/models/user_model.dart';

class FeedbackModel {
  int id;
  int rate;
  String opinion;
  User user;

  FeedbackModel({this.id, this.rate, this.opinion, this.user});

  Map<String, dynamic> toJson(){
    return {
      'id': id ?? 0,
      'rate': rate,
      'opinion': opinion,
      'user': user?.toJson(),
    };
  }
}