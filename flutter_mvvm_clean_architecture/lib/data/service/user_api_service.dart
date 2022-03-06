import 'package:dio/dio.dart';
import 'package:flutter_mvvm_clean_architecture/core/app_dependency.dart';
import 'package:flutter_mvvm_clean_architecture/data/service/dio_client.dart';

class UserApiService {
  final _dio = dependencies<DioClient>();

  Future<Response> postDataApi() => _dio.client.post("/hello/world");
}
