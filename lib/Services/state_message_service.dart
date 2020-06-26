import 'package:gotit/enums/result_message_enum.dart';

class StateMessage {
  static String get(ResultMessage message) {
    var result = "";
    switch(message) {
      case ResultMessage.processSuccess:
        result = "Process success";
        break;
      case ResultMessage.processFailed:
        result = "Process failed";
        break;
      case ResultMessage.unauthorized:
        result = "You are unauthorized please login with an uuthrized account";
        break;
      case ResultMessage.forbidden:
        result = "You can\'t be here this action is forbidden";
        break;
      case ResultMessage.notFound:
        result = "We are sorry we can't find your data";
        break;
      case ResultMessage.internalServerError:
        result = "We are sorry this is our fault please try again later";
        break;
      case ResultMessage.missedData:
        result = "Please fill all missing data";
        break;
      case ResultMessage.invalidData:
        result = "Please add a meaningful data";
        break;
      case ResultMessage.databaseError:
        result = "We are sorry this is our fault please try again later";
        break;
      case ResultMessage.generateTokenFaild:
        result = "We are sorry this is our fault please try again later";
        break;
      case ResultMessage.duplicateData:
        result = "It\'s seems that we saw this data before";
        break;
      case ResultMessage.emailExists:
        result = "This email already exist";
        break;
      case ResultMessage.emailOrPasswordWrong:
        result = "The email or password is wrong";
        break;
      case ResultMessage.userNotConfirmed:
        result = "Please confirm your email first";
        break;
      case ResultMessage.passwordNotMatched:
        result = "";
        break;
      case ResultMessage.notUserType:
        result = "";
        break;
      case ResultMessage.wrongPassword:
        result = "Your password is wrong please enter a correct password";
        break;
      default:
        result = "Undefined error";
        break;
    }
    return result;
  }
}