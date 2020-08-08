import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/helpers.dart';
import 'package:gotit/views/ui_elements/dropdown_element.dart';

import '../../enums/attributes_enum.dart';

class ItemAttributes{
  static Map<String, Map<Attributes, String>> _values = {};
  static Map<String, Widget> widget = {
    'car': Column(
      children: [
        DropdownElement(
          onSaved: (value) => setValue('car', 'model', value),
          icon: Icon(Icons.arrow_drop_down_circle),
          items: ['a', 'b', 'c'],
          decoration: InputDecoration(
            icon: Icon(Icons.work), labelText: 'Organizations'),
        ),
        DropdownElement(
          onSaved: (value) => setValue('car', 'brand', value),
          icon: Icon(Icons.arrow_drop_down_circle),
          items: ['d', 'e', 'f'],
          decoration: InputDecoration(
            icon: Icon(Icons.work), labelText: 'Organizations'),
        )
      ]
    ),
    'mobile': Column(
      children: [
        Text('hello mobile'),
        Text('hi mobile')
      ]
    )
  };
  static void setValue(String attribute, String key, String value) {
    _values[attribute][Helpers.getEnumFromString(Attributes.values, key)] = value;
  }
  static Map<Attributes, String> values(String attribute) {
    return _values[attribute];
  }
}
