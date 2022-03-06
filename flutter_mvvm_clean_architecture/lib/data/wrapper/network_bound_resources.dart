import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_clean_architecture/data/wrapper/api_response.dart';

abstract class NetworkBoundResources {
  Future<ApiResponse<ResultType>> downloadNetworkData<ResultType>({
    required Future<Response> apiCall,
    required ResultType Function(dynamic responseJson) mapJsonToModel,
  }) async {
    try {
      final responseBody = await apiCall;
      if (responseBody.statusCode == 200 || responseBody.statusCode == 202) {
        var body = responseBody.data ?? {};
        var responseJson = (body is String) ? jsonDecode(body) : body;
        debugPrint(responseBody.requestOptions.method.toString());
        debugPrint(responseBody.requestOptions.uri.toString());
        debugPrint(responseBody.requestOptions.headers.toString());
        debugPrint(body.toString());
        return Success(mapJsonToModel(responseJson));
      } else {
        var statusCode = responseBody.statusCode ?? -1;
        return Failure("Unknown error occurred", statusCode);
      }
    } on SocketException {
      debugPrint("No Internet Connection");
      return Failure("No Internet Connection", 0);
    } catch (e) {
      debugPrint(e.toString());
      return Failure("Unknown error occurred", 0);
    }
  }
}
