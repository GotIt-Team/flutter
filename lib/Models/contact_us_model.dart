
class ContactUs {
  String email;
  String subject;
  String message;

  ContactUs({this.email, this.subject, this.message});

  Map<String, dynamic> toJson(){
    return {
      'email': email,
      'subject': subject,
      'message': message
    };
  }
}
