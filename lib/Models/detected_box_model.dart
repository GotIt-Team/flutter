
class DetectedBox{
  String label;
  List<int>box;
  double confidence;
  DetectedBox({this.box,this.confidence,this.label});

  DetectedBox.fromJson(data) {
    label = data['label'];
    box = List.generate(4, (index) => data['box'][index]);
    confidence = data['confidence'];
  }
}