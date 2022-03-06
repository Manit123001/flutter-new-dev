import 'package:flutter_mvvm_clean_architecture/base/base_use_case.dart';
import 'package:flutter_mvvm_clean_architecture/core/app_dependency.dart';
import 'package:flutter_mvvm_clean_architecture/data/repo/user_repository_impl.dart';
import 'package:flutter_mvvm_clean_architecture/data/response/user_api_respsonse.dart';
import 'package:flutter_mvvm_clean_architecture/data/wrapper/api_response.dart';
import 'package:flutter_mvvm_clean_architecture/domain/repository/user_repository.dart';

class UserApiUseCase extends ApiUseCase<void, UserApiResponse> {
  final UserRepository _userRepository = dependencies<UserApiRepositoryImpl>();

  @override
  Future<ApiResponse<UserApiResponse>> execute(void params) {
    return _userRepository.fetchPostData();
  }
}
