import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/services/validator_service.dart';


import '../../helpers.dart';
import 'dropdown_element.dart';

class AddPostDropDown extends StatelessWidget{
  final ValueChanged<String> onSaved;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> validator;
  final Widget icon;
  final String labelText;
  final List<String> choices;
  AddPostDropDown({this.validator,this.labelText,this.choices,this.icon,this.onChanged,this.onSaved});
  _mapChoicesToDropDownItems(List<String> choices)
  {List<DropdownMenuItem<String>> items=[];
  for(String choice in choices){
    items.add(DropdownMenuItem<String>(child: Text(choice),value: choice,));
  }
  }
  @override
  Widget build(BuildContext context) {
    
     return DropdownElement(
                      validator: validator,
                      height: 88,
                      width: 60,
                      onChanged: onChanged,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        icon: Icon(Icons.person),
                        labelText: labelText,
                      ),
                      icon: icon,
                      iconSize: 24,
                      onSaved: onSaved,
                      items: _mapChoicesToDropDownItems(choices)
                    );
  }
}