import 'package:flutter_mvvm_clean_architecture/data/wrapper/api_response.dart';

abstract class BaseUseCase {}

abstract class ApiUseCase<Params, ResultType> extends BaseUseCase {
  Future<ApiResponse<ResultType>> execute(Params? params);
}
