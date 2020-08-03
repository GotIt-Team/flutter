import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/enums/attributes_enum.dart';
import 'package:gotit/enums/menu_results.dart';
import 'package:gotit/enums/organizations.dart';
import 'package:gotit/enums/MenuActions.dart';
import 'package:gotit/helpers.dart';
import 'package:gotit/services/validator_service.dart';
import 'package:gotit/views/ui_elements/dropdown_element.dart';
import 'package:gotit/views/ui_elements/expand_text.dart';
import 'package:gotit/views/ui_elements/cached_image_element.dart';
import 'package:gotit/views/widgets/chip.dart';
import 'package:gotit/views/widgets/images_slider.dart';
import 'package:gotit/views/widgets/pop_up_menu.dart';
import 'package:gotit/views/widgets/toast.dart';

class ItemDetailsCard extends StatefulWidget {
  final String userName;
  final String userImage;
  final String date;
  final List<String> images;
  final String content;
  final Map<Attributes, String> attributes;
  final GlobalKey<ScaffoldState> scaffoldkey;
  ItemDetailsCard(
      {this.scaffoldkey,
      this.userName,
      this.userImage,
      this.date,
      this.images,
      this.content,
      this.attributes});
  @override
  State<StatefulWidget> createState() {
    return ItemDetailsCardState();
  }
}

class ItemDetailsCardState extends State<ItemDetailsCard> {
  String organization;
  String mailContent;

  final GlobalKey<FormState> _requestFormKey = GlobalKey<FormState>();

  Widget _buildRequestForm(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Form(
        key: _requestFormKey,
        child: Wrap(spacing: 5, runSpacing: 10, children: <Widget>[
          AppBar(title: Text('Request Form')),
          /* SizedBox(
            height: 10,
            width: MediaQuery.of(context).size.width,
          ),*/
          DropdownElement(
            onSaved: (value) => organization = value,
            validator: Validator.requiredField,
            icon: Icon(Icons.arrow_drop_down_circle),
            items: Helpers.getListOfStringsFromEnum(Organizations.values),
            decoration: InputDecoration(
                icon: Icon(Icons.work), labelText: 'Organizations'),
          ),
          /*  SizedBox(
            height: 10,
            width: MediaQuery.of(context).size.width,
          ),*/
          TextFormField(
            onSaved: (value) => mailContent = value,
            validator: Validator.requiredField,
            decoration: InputDecoration(
                icon: Icon(Icons.mail), labelText: "Write your Message....."),
            maxLines: null,
            keyboardType: TextInputType.multiline,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 3),
            child: MaterialButton(
                elevation: 50,
                textColor: Colors.white,
                color: Theme.of(context).appBarTheme.color,
                onPressed: () => _submitRequestForm(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(' Send '),
                    Icon(Icons.send),
                  ],
                )),
          )
        ]),
      ),
    );
  }

  List<TagChip> _mapAttriputes(Map<Attributes, String> attributes) {
    return attributes.keys
        .map((Attributes key) => TagChip(
              function: () => print('samo3aleko'),
              icon: Icon(Icons.gps_fixed),
              label:
                  Text(Helpers.getStringFromEnum(key) + ': ' + attributes[key]),
            ))
        .toList();
  }

  void _submitRequestForm(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (_requestFormKey.currentState.validate()) {
      _requestFormKey.currentState.save();
      Navigator.pop(context);
     Toast.showToast(context: context,title: 'Annoncement', message: 'Message Sent to $organization successfully',icon: Icons.done
       );
      _requestFormKey.currentState.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
            leading: CircleAvatar(
              backgroundImage: CachedImage.provider(widget.userImage),
            ),
            title: Text(widget.userName),
            subtitle: Text(widget.date),
            trailing: PopUpMenuElement(
                actions: MenuActions.iFoundThis_reportAnOrganization,
                onSelect: (MenuResult chosen) {
                  if (chosen == MenuResult.none) {
                  } else if (chosen == MenuResult.reportAnOrganization) {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0))),
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) =>
                            _buildRequestForm(context));
                  } else if (chosen == MenuResult.reportAnOrganization) {
                    Navigator.pushNamed(context, '/add-post');
                  }
                })),
        ImageSlider(
          images: widget.images,
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: ExpandText(
            widget.content,
            style: TextStyle(fontSize: 18),
          ),
        ),
        Wrap(
          spacing: 3.0,
          runSpacing: 3.0,
          children: _mapAttriputes(widget.attributes),
        )
      ],
    );
  }
}
