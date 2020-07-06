import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gotit/enums/dialog_buttons_enum.dart';
import 'package:gotit/enums/dialog_result_enum.dart';
import 'package:gotit/enums/result_message_enum.dart';
import 'package:gotit/presenters/image_picker_presenter.dart';
import 'package:gotit/services/state_message_service.dart';
import 'package:gotit/views/widgets/alert_dialog.dart';
import 'package:gotit/views/widgets/progress_dialog.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDialog {
  final ImagePickerPresenter _imagePickerPresenter = ImagePickerPresenter();
  final ImagePicker _image = ImagePicker();
  static const int max_len = 1024 * 1024 * 5;

  Future<String> getImage(BuildContext context) async {
    var file = await showModalBottomSheet(context: context, builder: (BuildContext context) => _build(context));
    if(file == null) return null;
    await ProgressDialog.show(
      context: context,
      method: () => _imagePickerPresenter.uploadImage(file)
    );
    return _imagePickerPresenter.imageUrl;
  }

  void _validateSize(BuildContext context, PickedFile image) async {
    var file = File(image.path);
    if(file.lengthSync() > max_len) {
      await _maxSizeDialog(context).then((value) {
        if(value == DialogResult.cancel) Navigator.pop(context, null);
      });
    } else {
      Navigator.pop(context, file);
    }
  }

  void _openCamera(BuildContext context) async {
    var image = await _image.getImage(source: ImageSource.camera);
    if (image != null)
      _validateSize(context, image);
  }

  void _openGallery(BuildContext context) async {
    var image = await _image.getImage(source: ImageSource.gallery);
    if (image != null)
      _validateSize(context, image);
  }

  Future<DialogResult> _maxSizeDialog(BuildContext context) async{
    return DialogBox.show(
      context: context,
      title: Text('Error'),
      content: Text(
        StateMessage.get(ResultMessage.exceedMaxContent),
        style: TextStyle(
          fontSize: 20
        ),
        textAlign: TextAlign.center,
      ),
      dialogButton: DialogButtons.retry_cancel
    );
  }

  Widget _build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _imageSource(context, icon: Icons.camera_alt, lable: 'Camera', onPressed: () => _openCamera(context)),
          _imageSource(context, icon: Icons.photo, lable: 'Gallery', onPressed: () => _openGallery(context)),
          _imageSource(context, icon: Icons.cancel, lable: 'Cancel', onPressed: () => Navigator.pop(context, null))
        ],
      )
    );
  }

  Widget _imageSource(BuildContext context, {String lable, IconData icon, VoidCallback onPressed}) {
    return SizedBox.fromSize(
      size: Size(80, 80),
      child: FlatButton(
        onPressed: onPressed,
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Icon(icon, color: Theme.of(context).primaryColor),
            Text(lable, style: TextStyle(color: Theme.of(context).primaryColor))
          ],
        ),
      ),
    );      
  }

}
