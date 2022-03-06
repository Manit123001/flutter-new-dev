import 'package:flutter_mvvm_clean_architecture/core/navigation/navigation.dart';
import 'package:flutter_mvvm_clean_architecture/data/repository/user_api_repository_impl.dart';
import 'package:flutter_mvvm_clean_architecture/data/service/dio_client.dart';
import 'package:flutter_mvvm_clean_architecture/data/service/user_api_service.dart';
import 'package:flutter_mvvm_clean_architecture/domain/usecase/user_api_use_case.dart';
import 'package:flutter_mvvm_clean_architecture/data/store/user_store.dart';
import 'package:get_it/get_it.dart';

GetIt dependencies = GetIt.instance;

void setDependencies() {
  dependencies.registerLazySingleton(() => UserStore());
  dependencies.registerLazySingleton(() => UserApiRepositoryImpl());
  dependencies.registerLazySingleton(() => UserApiUseCase());
  dependencies.registerLazySingleton(() => Navigation());
  dependencies.registerLazySingleton(() => DioClient());
  dependencies.registerLazySingleton(() => UserApiService());
}
