import 'package:dio/dio.dart';
import 'package:flutter_mvvm_clean_architecture/data/interceptors/mock_interceptor.dart';

class DioClient {
  Dio? _dio;

  Dio get client {
    if (_dio == null) {
      _dio = Dio();
      _dio?.options.baseUrl = "https://www.example.com";
      _interceptorProcess();
      _setupCertificate();
    }

    return _dio!;
  }

  void _interceptorProcess() {
    if (_dio!.interceptors.isEmpty) {
      _dio!.interceptors.add(MockInterceptor());
    }
  }

  void _setupCertificate() {}
}
