import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:gotit/enums/shared_preferences_enum.dart';
import 'package:gotit/models/result_model.dart';
import 'package:dio/dio.dart';
import 'package:gotit/services/shared_preferences_service.dart';

class Http {
  static final String _csharpDebugUrl = "localhost:54375";
  static final String _csharpProductionUrl = "";
  static final String _pythonDebugUrl = "localhost:5000";
  static final String _pythonProductionUrl = "";
  static final int _requestTimeout = 20000;

  static String _backendAppUrl(bool isCsharp) {
    return isCsharp ? 
      kReleaseMode ? _csharpProductionUrl : _csharpDebugUrl : 
      kReleaseMode ? _pythonProductionUrl : _pythonDebugUrl;
  }

  static Result<TReponse> _fail<TReponse>(String exception){
    return Result(data: null, count: null, message: exception, isSucceeded: false);
  }

  static Result<TResponse> _getResult<TResponse>(Response response, dynamic Function(dynamic) mapper){
    var result = Result<TResponse>();
    switch (response.statusCode) {
      case 200:
        // if there's a mapper function
        if(mapper != null) {
          result.data = mapper(response.data['data']);
        } else {
          result.data = response.data['data'];
        }
        result.count = response.data['count'];
        result.isSucceeded = response.data['isSucceeded'];
        result.message = response.data['message'];
        break;
      // if any error happened
      default:
        var message = response.data['message'];
        result = _fail(message != null ? message : response.statusMessage);
    }
    return result;
  }

  static Future<Map<String, String>> _setToken(Map<String, String> headers) async {
    // set Token in header of request
    var token = await SharedPreference.getData(key: SharedPreferenceKeys.user_token);
    
    if(headers == null)
      headers = {}; 

    if(token != null) {
      headers['Authorization'] = 'Bearer ' + token;
    }
    
    return headers;
  }

  static Future<Result<TReponse>> send<TReponse>({@required String endpointUrl, String method='GET', Map<String, dynamic> headers, Map<String, dynamic> queryParameters, Object body, bool isCsharp = true, dynamic Function(dynamic) mapper}) async{
    try {
      // set token
      headers = await _setToken(headers);
      
      // get url of the backend server
      var url = Uri.http(_backendAppUrl(isCsharp), '${'/api/$endpointUrl'}');
      
      // define response
      Dio dio = Dio();
      var response = await dio.request(
        url.toString(),
        data: jsonEncode(body),
        queryParameters: queryParameters,
        options: Options(
          method: method,
          headers: headers,
          contentType: 'application/json; charset=utf-8',
          sendTimeout: _requestTimeout,
          responseType: ResponseType.json
        )
      );
      
      return _getResult(response, mapper);
    }
    catch(e){
      return _fail(e.toString());
    }
  }
}