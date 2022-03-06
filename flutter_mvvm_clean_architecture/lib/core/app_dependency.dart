import 'package:flutter_mvvm_clean_architecture/core/navigation/navigation.dart';
import 'package:flutter_mvvm_clean_architecture/data/repo/user_repository_impl.dart';
import 'package:flutter_mvvm_clean_architecture/domain/usecase/user_api_use_case.dart';
import 'package:flutter_mvvm_clean_architecture/utils/string_uril.dart';
import 'package:get_it/get_it.dart';

GetIt dependencies = GetIt.instance;

void setDependencies() {
  dependencies.registerLazySingleton(() => UserStore());
  dependencies.registerLazySingleton(() => UserApiRepositoryImpl());
  dependencies.registerLazySingleton(() => UserApiUseCase());
  dependencies.registerLazySingleton(() => Navigation());

  
}
