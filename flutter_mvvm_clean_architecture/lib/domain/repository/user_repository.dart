import 'package:flutter_mvvm_clean_architecture/data/response/user_api_respsonse.dart';
import 'package:flutter_mvvm_clean_architecture/data/wrapper/api_response.dart';

abstract class UserRepository {
  Future<ApiResponse<UserApiResponse>> fetchPostData();
}
