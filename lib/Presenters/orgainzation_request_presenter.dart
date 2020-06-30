import 'package:gotit/Models/requests_model.dart';

class OrganizationRequestPresenter{
  Request organizationRequest = Request();

  setTitle(String title){
    organizationRequest.title=title;
  }
  setNameOrganization(String name){
    organizationRequest.receiver.name=name;
  }
  setMessageContent(String message){
    organizationRequest.content=message;
  }




}