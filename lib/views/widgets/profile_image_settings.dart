import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/views/widgets/image_picker_dialog.dart';

class ProfileImageSettings extends StatefulWidget {
  final String image;
  ProfileImageSettings(this.image);
  @override
  State<StatefulWidget> createState()  => ProfileImageState();
  
}

class ProfileImageState extends State<ProfileImageSettings> {
  String _image;
  final ImagePickerDialog _imagePicker = ImagePickerDialog();

  @override
  void initState() {
    super.initState();
  }

  getImage(BuildContext context) {
    _imagePicker.getImage(context).then((value) {
      if(value == null) return;
      setState(() {
        _image = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => getImage(context),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40) ,
          border: Border.all(
            width: 2,
            color: Theme.of(context).primaryColor,
          ),
        ),
        child: CircleAvatar(
          radius: 35,
          backgroundImage: _image == null ? widget.image : NetworkImage(_image),
        ),
      ),
    );
        
  }
  
}
