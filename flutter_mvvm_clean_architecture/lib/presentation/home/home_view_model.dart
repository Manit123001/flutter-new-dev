import 'package:flutter_mvvm_clean_architecture/base/view_model.dart';
import 'package:flutter_mvvm_clean_architecture/core/app_dependency.dart';
import 'package:flutter_mvvm_clean_architecture/core/app_extension.dart';
import 'package:flutter_mvvm_clean_architecture/core/navigation/navigation.dart';
import 'package:flutter_mvvm_clean_architecture/data/repository/user_api_repository_impl.dart';
import 'package:flutter_mvvm_clean_architecture/data/wrapper/api_response.dart';
import 'package:flutter_mvvm_clean_architecture/domain/repository/user_repository.dart';
import 'package:flutter_mvvm_clean_architecture/domain/usecase/user_api_use_case.dart';
import 'package:flutter_mvvm_clean_architecture/route/route_management.dart';
import 'package:flutter_mvvm_clean_architecture/data/store/user_store.dart';

class HomeViewModel extends ViewModel {
  final UserRepository _userRepository = dependencies<UserApiRepositoryImpl>();
  final UserApiUseCase _userApiUseCase = dependencies<UserApiUseCase>();
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

  void fetchUseCaseData() async {
    loadingState();
    var apiResponse = await _userApiUseCase.execute();
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

  UserStore get getUser {
    return _userStore;
  }

  bool get hasUser {
    return getUser.name.isNotNull() && getUser.age.isNotNull();
  }

  void goTo() {
    _navigation.navigateTo(Routes.aboutPage);
  }
}
