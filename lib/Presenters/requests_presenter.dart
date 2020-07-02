import 'package:flutter/material.dart';
import 'package:gotit/enums/request_state_enum.dart';
import 'package:gotit/enums/user_type_enum.dart';
import 'package:gotit/models/requests_model.dart';
import 'package:gotit/models/result_model.dart';
import 'package:gotit/services/http_service.dart';
import 'package:gotit/services/user_data_service.dart';

class RequestsPresenter with ChangeNotifier {
  List<Request> _requests = [];
  Result<bool> deleteResult;
  
  Future<void> getRequests(RequestState state) async{
    var result = await Http.send<List<Request>>(
      endpointUrl: 'user/requests',
      queryParameters: {
        "state": state
      },
      mapper: (data) => data != null ? List<Request>.generate(data.length, (index) => Request.fromJson(data[index])) : []
    );

    if(result.isSucceeded) {
      _requests = result.data;
    }
  }

  List<Request> get requests {
    return _requests;
  }

  Future<void> deleteRequset(int index, int id, RequestState state) async {
    deleteResult = await Http.send<bool>(
      endpointUrl: '${'user/request/$id'}',
      method: 'DELETE',
      queryParameters: {
        "state": state.index + 1
      }
    );

    if(deleteResult.isSucceeded) {
      _requests.removeAt(index);
      notifyListeners();
    }
  }

  UserType get userType {
    return UserData.user.type;
  }
}