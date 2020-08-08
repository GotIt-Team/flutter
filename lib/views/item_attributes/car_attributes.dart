import 'package:flutter/material.dart';
import 'package:gotit/views/ui_elements/dropdown_element.dart';

import 'item_attributes_map.dart';

class CarAttributes extends StatelessWidget{
@override
  Widget build(BuildContext context) {
    
    return ListView(
      shrinkWrap: true,
      children: [
      DropdownElement(
        validator: (String value){},
        onSaved: (value) => ItemAttributes.setValue('car', 'brand', value),
        icon: Icon(Icons.arrow_drop_down_circle),
        items: ['BMW', 'Fiat', 'Porsche','KIA','Toyota'],
        decoration: InputDecoration(
            icon: Icon(Icons.local_car_wash), labelText: 'Car brand'),
      ),
      SizedBox(height:10),
      TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.credit_card),
          labelText: 'Model',
          hintText: 'Model',
        ),
        onSaved: (String value) =>ItemAttributes.setValue('car','model',value)
      ),
      SizedBox(height:10),
      TextFormField(
        validator: (String value){},
        decoration: InputDecoration(
          icon: Icon(Icons.confirmation_number),
          labelText: 'Plate numbers',
          hintText: 'Plate numbers',
        ),
        onSaved: (String value) =>ItemAttributes.setValue('car','plateNumbers',value)
      ),
    ]);
  }
}