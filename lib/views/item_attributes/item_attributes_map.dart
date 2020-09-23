import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/enums/gender_enum.dart';
import 'package:gotit/helpers.dart';
import 'package:gotit/services/validator_service.dart';
import 'package:gotit/views/item_attributes/car_attributes.dart';
import 'package:gotit/views/ui_elements/dropdown_element.dart';

import '../../enums/attributes_enum.dart';

class ItemAttributes {
  static Map<String, Map<Attributes, String>> _values = {};
  static Map<String, Widget> widget = {
    'car': CarAttributes(),
    'laptop': Column(children: [
      DropdownElement(
        onSaved: (value) => ItemAttributes.setValue('laptop', 'brand', value),
        icon: Icon(Icons.arrow_drop_down_circle),
        items: ['Lenovo', 'Razer', 'Apple', 'HP', 'DELL', 'Acer', 'Asus', 'msi'],
        decoration: InputDecoration(
            icon: Icon(Icons.laptop), labelText: 'laptop brand'),
      ),
      DropdownElement(
        onSaved: (value) => ItemAttributes.setValue('laptop', 'model', value),
        icon: Icon(Icons.arrow_drop_down_circle),
        items: ['GL63', 'GL73', 'GT70','GT76', 'GE72', 'GE73', 'PS42', 'PS63', 'GP63', 'GP73'],
        decoration: InputDecoration(
            icon: Icon(Icons.laptop_mac), labelText: 'laptop model'),
      ),
      TextFormField(
        validator: Validator.empty,
        decoration: InputDecoration(
          icon: Icon(Icons.confirmation_number),
          labelText: 'Serial number',
          hintText: 'enter serial number if you have it',
        ),
        onSaved: (String value) =>ItemAttributes.setValue('laptop','serial  ',value)
      )
    ]),
    'person': Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: DropdownElement(
          onSaved: (value) => ItemAttributes.setValue('person', 'ageStage', value),
          icon: Icon(Icons.arrow_drop_down_circle),
          items: ['Child', 'Under age', 'Guy', 'Elderly'],
          decoration: InputDecoration(
            icon: Icon(Icons.group), labelText: 'age stage'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: DropdownElement(
          onSaved: (value) => ItemAttributes.setValue('person', 'gender', value),
          icon: Icon(Icons.arrow_drop_down_circle),
          items: Helpers.getListOfStringsFromEnum(Gender.values),
          decoration: InputDecoration(
              icon: Icon(Icons.person), labelText: 'gender'),
        ),
      ),
    ])
  };
  static void setValue(String attribute, String key, String value) {
    if (value == null || !value.isNotEmpty) return;
    if (_values[attribute] == null) _values[attribute] = {};
    _values[attribute][Helpers.getEnumFromString(Attributes.values, key)] =
        value;
  }

  static Map<Attributes, String> values(String attribute) {
    return _values[attribute];
  }
}
