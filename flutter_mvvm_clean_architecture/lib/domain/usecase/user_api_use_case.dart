import 'package:flutter_mvvm_clean_architecture/base/base_use_case.dart';
import 'package:flutter_mvvm_clean_architecture/core/app_dependency.dart';
import 'package:flutter_mvvm_clean_architecture/data/repository/user_api_repository_impl.dart';
import 'package:flutter_mvvm_clean_architecture/data/response/user_api_respsonse.dart';
import 'package:flutter_mvvm_clean_architecture/data/wrapper/api_response.dart';

class UserApiUseCase extends ApiUseCase<void, UserApiResponse> {
  final _userRepository = dependencies<UserApiRepositoryImpl>();

  @override
  Future<ApiResponse<UserApiResponse>> execute([void params]) async {
    return _userRepository.fetchPostData();
  }
}
