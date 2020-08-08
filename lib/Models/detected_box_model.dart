import 'dart:ffi';

class DetectedBox{
  String label;
  List<int>box;
  Float confidence;
  DetectedBox({this.box,this.confidence,this.label});

  DetectedBox.fromJson(data) {
    label = data['label'];
    box = data['box'];
    confidence = data['confidence'];
  }
}