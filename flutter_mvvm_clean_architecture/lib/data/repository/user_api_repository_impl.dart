import 'package:dio/dio.dart';
import 'package:flutter_mvvm_clean_architecture/core/app_dependency.dart';
import 'package:flutter_mvvm_clean_architecture/data/interceptors/mock_interceptor.dart';
import 'package:flutter_mvvm_clean_architecture/data/response/user_api_respsonse.dart';
import 'package:flutter_mvvm_clean_architecture/data/service/dio_client.dart';
import 'package:flutter_mvvm_clean_architecture/data/service/user_api_service.dart';
import 'package:flutter_mvvm_clean_architecture/data/wrapper/api_response.dart';
import 'package:flutter_mvvm_clean_architecture/data/wrapper/network_bound_resources.dart';
import 'package:flutter_mvvm_clean_architecture/domain/repository/user_repository.dart';

class UserApiRepositoryImpl extends NetworkBoundResources with UserRepository {
  final _userService = dependencies<UserApiService>();

  @override
  Future<ApiResponse<UserApiResponse>> fetchPostData() {
    return downloadNetworkData(
      apiCall: _userService.postDataApi(),
      mapJsonToModel: (json) => UserApiResponse.fromMap(json),
    );
  }
}
