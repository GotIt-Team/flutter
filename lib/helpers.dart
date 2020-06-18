
class Helpers {
  static T getEnumFromString<T>(List<T> values, String value) {
    return values.firstWhere((type) => getStringFromEnum(type).toUpperCase() == value.toUpperCase(),
      orElse: () => null);
  }

  static String getStringFromEnum<T>(T genaricEnum){
    return genaricEnum.toString().split(".").last;
  }
}
