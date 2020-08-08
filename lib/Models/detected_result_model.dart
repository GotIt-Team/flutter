import 'package:gotit/models/detected_box_model.dart';

class DetectionResult{
  String imageName;
  int count;
  List<DetectedBox>boxes;
  String embeddings;
  DetectionResult(this.imageName,this.count,this.boxes, this.embeddings);

  DetectionResult.fromJson(dynamic data) {
    if(data == null) return;
    imageName = data['imageName'];
    count = data['count'];
    boxes = List.generate(data['detected'].length, (index) => DetectedBox.fromJson(data['detected'][index]));
  }
}