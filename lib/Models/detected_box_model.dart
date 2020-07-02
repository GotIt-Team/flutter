import 'dart:ffi';

class DetectedBox{
  String label;
  List<int>box;
  Float confidence;
  String embeddings; 
  DetectedBox({this.box,this.confidence,this.embeddings,this.label});
}