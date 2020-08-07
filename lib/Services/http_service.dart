import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:gotit/models/result_model.dart';
import 'package:dio/dio.dart';
import 'package:gotit/services/user_data_service.dart';
import 'package:path/path.dart';

class Http {
  static final String _csharpUrl = !kReleaseMode ? "192.168.1.38:45455" : "got-it.azurewebsites.net";
  static final String _pythonUrl = !kReleaseMode ? "192.168.1.38:8080" : "ai-got-it.azurewebsites.net";

  static String _backendAppUrl(bool isCsharp) {
    return isCsharp ? 
      _csharpUrl : _pythonUrl;
  }

  static Result<TResponse> _fail<TResponse>(String exception){
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
    var token = UserData.token;
    
    if(headers == null)
      headers = {}; 

    if(token != null) {
      headers['Authorization'] = 'Bearer ' + token;
    }
    
    return headers;
  }

  static Future<Result<List<String>>> uploadImage<TResponse>(List<File> files, {Map<String, dynamic> headers, Map<String, dynamic> queryParameters}) async {
    Map<String, MultipartFile> filesMap = {};
    for(var i = 0; i < files.length; i++){
      filesMap['${'file-$i'}'] = MultipartFile.fromFileSync(files[0].path, filename: basename(files[0].path));
    }
    FormData formData = FormData.fromMap(filesMap);
    return send(
      endpointUrl: 'system/upload-image', 
      body: formData,
      headers: headers,
      method: 'POST',
      queryParameters: queryParameters,
      isFormData: true,
      mapper: (data) => List<String>.generate(data.length, (index) => data[index].toString())
    );
  }

  static Future<Result<TResponse>> send<TResponse>({@required String endpointUrl, String method='GET', Map<String, dynamic> headers, Map<String, dynamic> queryParameters, Object body, bool isCsharp = true, dynamic Function(dynamic) mapper, bool isFormData = false}) async{
    try {
      // set token
      headers = await _setToken(headers);
      
      // get url of the backend server
      var url = Uri.http(_backendAppUrl(isCsharp), '${'/api/$endpointUrl'}');
      
      // define response
      Dio dio = Dio();
      var response = await dio.request(
        url.toString(),
        data: isFormData ? body : jsonEncode(body),
        queryParameters: queryParameters,
        options: Options(
          method: method,
          headers: headers,
          contentType: isFormData ? 'multipart/form-data;' : 'application/json',
          sendTimeout: 20000,
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