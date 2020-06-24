
class Helpers {
  static T getEnumFromString<T>(List<T> values, String value) {
    return values.firstWhere((type) => getStringFromEnum(type).toUpperCase() == value.toUpperCase(),
      orElse: () => null);
  }

  static String getStringFromEnum<T>(T genaricEnum){
    return genaricEnum.toString().split(".").last;
  }

  static String truncateWithEllipsis(String text, int length){
    return (text.length <= length)
      ? text : '${text.substring(0, length)}...';
  }
}
