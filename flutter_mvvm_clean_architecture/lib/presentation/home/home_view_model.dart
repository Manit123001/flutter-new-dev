import 'package:flutter_mvvm_clean_architecture/base/view_model.dart';
import 'package:flutter_mvvm_clean_architecture/core/app_dependency.dart';
import 'package:flutter_mvvm_clean_architecture/core/navigation/navigation.dart';
import 'package:flutter_mvvm_clean_architecture/data/repo/user_repository_impl.dart';
import 'package:flutter_mvvm_clean_architecture/data/response/user_api_respsonse.dart';
import 'package:flutter_mvvm_clean_architecture/data/wrapper/api_response.dart';
import 'package:flutter_mvvm_clean_architecture/domain/repository/user_repository.dart';
import 'package:flutter_mvvm_clean_architecture/route/route_management.dart';
import 'package:flutter_mvvm_clean_architecture/utils/string_uril.dart';

class HomeViewModel extends ViewModel {
  final UserRepository _userRepository = dependencies<UserApiRepositoryImpl>();
  final UserStore _userStore = dependencies<UserStore>();
  final Navigation _navigation = dependencies<Navigation>();

  void fetchData() async {
    loadingState();
    var apiResponse = await _userRepository.fetchPostData();
    if (apiResponse.success) {
      var data = apiResponse.data();
      _userStore.name = data.name;
      _userStore.age = data.age;
      successfulState();
    } else {
      print("IS fail errorMessage: ${apiResponse.error().errorCode}");
      print("IS fail errorCode: ${apiResponse.error().errorMessage}");
      errorState();
    }
  }

  String? getName() {
    return _userStore.name;
  }

  void goTo() {
    _navigation.navigateTo(Routes.aboutPage);
  }
}
