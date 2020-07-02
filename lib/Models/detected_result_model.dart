import 'package:gotit/models/detected_box_model.dart';

class DetectedResult{
  String imageName;
  int count;
  List<DetectedBox>boxes;
  DetectedResult(this.imageName,this.count,this.boxes);
}