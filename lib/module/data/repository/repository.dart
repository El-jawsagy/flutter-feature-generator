
const String stub = """
import '/features/{ModuleName}_feature/domain/model/{ModuleName}_model.dart';
import 'package:dartz/dartz.dart';
import '/core/model/success_model.dart';
import '/core/error_handling/custom_error.dart';
import '/features/{ModuleName}_feature/domain/repository/{ModuleName}_repository_interface.dart';
import '/features/{ModuleName}_feature/data/data_source/{ModuleName}_remote_data_source.dart';

class {Module}ListRepository extends {Module}ListRepositoryInterface {
  final {Module}RemoteDataScoursInterface remoteDataScoursInterface;

  {Module}ListRepository(this.remoteDataScoursInterface);


  @override
  Future<Either<CustomError, List<{Module}Model>>> get{Module}List(
      {required int page}) {
    return remoteDataScoursInterface.get{Module}List(page: page).then(
        (value) => value.fold(
            (l) => left(l), (r) => right({ModuleName}ListFromJson(r.data))));
  }
  
  
  @override
  Future<Either<CustomError, {Module}Model>> get{Module}ItemDetails(
      {required {Module}Model {ModuleName}Item}) {
    return remoteDataScoursInterface. get{Module}ItemDetails({ModuleName}Item: {ModuleName}Item).then(
        (value) => value.fold(
            (l) => left(l), (r) => right({Module}Model.fromJson(r.data))));
  }
  
  
  @override
  Future<Either<CustomError, SuccessModel>> delete{Module}(
      {required {Module}Model {ModuleName}Item}) {
    return remoteDataScoursInterface.delete{Module}(
        {ModuleName}Id: {ModuleName}Item);
  }
}

""";
