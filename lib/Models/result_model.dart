class Result<T> {
  T data;
  int count;
  bool isSucceeded;
  String message;

  Result({this.data, this.count, this.message, this.isSucceeded});
}