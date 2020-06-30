import 'dart:io';
import 'package:gotit/services/http_service.dart';

class ImagePickerPresenter {
  String _imageUrl;

  Future<void> uploadImage(File file) async {
    var result = await Http.uploadImage([file]);
    if(result.isSucceeded && result.data.length > 0) {
      _imageUrl = result.data.first;
    }
    else {
      _imageUrl = null;
    }
  }

  String get imageUrl {
    return _imageUrl;
  }
}