const String stub = """
import 'package:dartz/dartz.dart';
import '/core/error_handling/custom_error.dart';
import '/core/model/success_model.dart';
import '/features/{ModuleName}_feature/domain/model/{ModuleName}_model.dart';
import '/features/{ModuleName}_feature/domain/repository/{ModuleName}_repository_interface.dart';

class {Module}UesCases {
  final {Module}ListRepositoryInterface repositoryInterface;

  {Module}UesCases(this.repositoryInterface);

  Future<Either<CustomError, List<{Module}Model>>> getListOf{Module}(
      {required int page}) {
    return repositoryInterface.get{Module}List(page: page).then((value) =>
        value.fold((l) => Left(l), (r) => right(r)));
  }
  
  
  Future<Either<CustomError, {Module}Model>> get{Module}ItemDetails(
      {required {Module}Model {ModuleName}Item}) {
    return repositoryInterface
        .get{Module}ItemDetails({ModuleName}Item: {ModuleName}Item)
        .then((value) => value.fold((l) => Left(l), (r) => right(r)));
  }

  Future<Either<CustomError, SuccessModel>> delete{Module}(
      {required {Module}Model {ModuleName}Item}) {
    return repositoryInterface.delete{Module}(
      {ModuleName}Item: {ModuleName}Item,
    );
  }
}
""";
