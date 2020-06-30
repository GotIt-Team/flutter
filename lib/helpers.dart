import 'package:flutter/material.dart';

class Helpers {
  static T getEnumFromString<T>(List<T> values, String value) {
    return values.firstWhere(
        (type) => getStringFromEnum(type).toUpperCase() == value.toUpperCase(),
        orElse: () => null);
  }

  static String getStringFromEnum<T>(T genaricEnum) {
    return genaricEnum.toString().split(".").last;
  }

  static String truncateWithEllipsis(String text, int length) {
    return (text.length <= length) ? text : '${text.substring(0, length)}...';
  }

  static List<String> getListOfStringsFromEnum<T>(List<T> values) {
    List <String>x=[];
    x  = values.map((usedEnum) {
      return Helpers.getStringFromEnum(usedEnum).toString();
    }).toList();
    print (x);
    return x;
  }
}
