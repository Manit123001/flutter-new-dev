import 'package:dio/dio.dart';
import 'package:flutter_mvvm_clean_architecture/data/interceptors/mock_interceptor.dart';
import 'package:flutter_mvvm_clean_architecture/data/response/user_api_respsonse.dart';
import 'package:flutter_mvvm_clean_architecture/data/wrapper/api_response.dart';
import 'package:flutter_mvvm_clean_architecture/data/wrapper/network_bound_resources.dart';
import 'package:flutter_mvvm_clean_architecture/domain/repository/user_repository.dart';

Future<Response> postDataApi() {
  var dio = Dio();
  dio.interceptors.add(MockInterceptor());
  return dio.post("http://mock.com");
}

class UserApiRepositoryImpl extends NetworkBoundResources with UserRepository {
  @override
  Future<ApiResponse<UserApiResponse>> fetchPostData() {
    return downloadNetworkData(
      apiCall: postDataApi(),
      mapJsonToModel: (json) => UserApiResponse.fromMap(json),
    );
  }
}
