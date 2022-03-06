import 'package:dio/dio.dart';

class MockInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("=============== uri ${options.uri}");
    print("=============== baseUrl ${options.baseUrl}");
    print("=============== path ${options.path}");
    handler.resolve(Response(requestOptions: options, statusCode: 200, data: {"name": "sompong", "age": "10"}));
  }
}
