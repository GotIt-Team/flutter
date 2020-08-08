import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/helpers.dart';
import 'package:gotit/services/validator_service.dart';
import 'package:gotit/views/item_attributes/car_attributes.dart';
import 'package:gotit/views/ui_elements/dropdown_element.dart';

import '../../enums/attributes_enum.dart';

class ItemAttributes {
  static Map<String, Map<Attributes, String>> _values = {};
  static Map<String, Widget> widget = {
    'car': CarAttributes(),
    'mobile': Column(children: [    DropdownElement(
      
        onSaved: (value) => ItemAttributes.setValue('car', 'brand', value),
        icon: Icon(Icons.arrow_drop_down_circle),
        items: ['BMW', 'Fiat', 'Porsche','KIA','Toyota'],
        decoration: InputDecoration(
            icon: Icon(Icons.local_car_wash), labelText: 'Car brand'),
      ),    DropdownElement(
        
        onSaved: (value) => ItemAttributes.setValue('mobile', 'brand', value),
        icon: Icon(Icons.screen_lock_portrait),
        items: ['SAMSUNG', 'Apple', 'Xiaomi','Huawei','Lenovo'],
        decoration: InputDecoration(
            icon: Icon(Icons.local_car_wash), labelText: 'Car brand'),
      ), Text('hi mobile')])
  };
  static void setValue(String attribute, String key, String value) {
    if(value == null || !value.isNotEmpty) return;
    if(_values[attribute] == null) _values[attribute] = {};
    _values[attribute][Helpers.getEnumFromString(Attributes.values, key)] =
        value;
  }

  static Map<Attributes, String> values(String attribute) {
    return _values[attribute];
  }
}
