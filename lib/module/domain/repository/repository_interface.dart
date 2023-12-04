
const String stub = """
import '/features/{ModuleName}_feature/domain/model/{ModuleName}_model.dart';
import 'package:dartz/dartz.dart';

import '/core/error_handling/custom_error.dart';
import '/core/model/success_model.dart';

abstract class {Module}ListRepositoryInterface {
  Future<Either<CustomError, List<{Module}Model>>> get{Module}List(
      {required int page});

  Future<Either<CustomError, {Module}Model>> get{Module}ItemDetails(
      {required {Module}Model  {ModuleName}Item});
      
  Future<Either<CustomError, SuccessModel>> delete{Module}(
      {required {Module}Model {ModuleName}Item});

}
""";
