import 'package:gotit/Models/requests_model.dart';
import 'package:gotit/Services/http_service.dart';


class OrganizationRequestPresenter{
  Request organizationRequest = Request();
  List <String> _specificOrganization=[];


  setTitle(String title){
    organizationRequest.title=title;
  }
  setNameOrganization(String name){
    organizationRequest.receiver.name=name;
  }
  setMessageContent(String message){
    organizationRequest.content=message;
  }

  //orgType -> hospital ,nurse home ,
  Future<void>getSpecificOrganization(String orgType)async{
    var result = await Http.send<List<String>>(
        endpointUrl: '',
       // mapper: (dynamic data) => data !=  null ? List<String>.generate(data.length, (index) => organizationRequest.fromJson(data[index])) : []
    );

    if(result.isSucceeded){
      _specificOrganization = result.data;
    }
  }

  List<String> get organization {
    return _specificOrganization;
  }

  Future<void> sendRequest() async {

    await Http.send<bool>(
      endpointUrl: '',
      method: "POST",
      body: organizationRequest,
    );
  }   //to send request to organization




}