class UserPassword {
  String oldPassword;
  String newPassword;
  String repeatedNewPassword;

  UserPassword({this.oldPassword, this.newPassword, this.repeatedNewPassword});

  Map<String, dynamic> toJson() {
    return {
      'oldPassword': oldPassword,
      'newPassword': newPassword,
      'repeatedNewPassword': repeatedNewPassword
    };
  }
}