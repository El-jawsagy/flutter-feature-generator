const String stub = """
import '/features/{ModuleName}_feature/domain/model/{ModuleName}_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '/core/constants/keys/api_keys.dart';
import '/core/data_source/network/dio_helper.dart';
import '/core/error_handling/custom_error.dart';
import '/core/error_handling/custom_exception.dart';
import '/core/model/base_model.dart';
import '/core/model/success_model.dart';

abstract class {Module}RemoteDataScoursInterface {
  Future<Either<CustomError, BaseModel>> get{Module}List(
      {required int page});
      
  Future<Either<CustomError, BaseModel>> get{Module}ItemDetails(
      {required {Module}Model  {ModuleName}Item});

  Future<Either<CustomError, SuccessModel>> delete{Module}(
      {required {Module}Model {ModuleName}Id});
}

class {Module}RemoteDataScoursImpl
    extends {Module}RemoteDataScoursInterface {
  @override
  Future<Either<CustomError, BaseModel>> get{Module}List(
      {required int page}) async {
    try {
      ///todo: write you api key here
      String {ModuleName}Url = '';
      Response response = await DioHelper.getDate(url: {ModuleName}Url);

      return right(BaseModel.fromJson(response.data));
    } on CustomException catch (ex) {
      return Left(CustomError(
          type: ex.type, errorMassage: ex.errorMassage, imgPath: ex.imgPath));
    }
  }
  
  @override
  Future<Either<CustomError, BaseModel>> get{Module}ItemDetails(
      {required {Module}Model  {ModuleName}Item}) async {
    try {
      ///todo: write you api key here
      String {ModuleName}Url = '';
      Response response = await DioHelper.getDate(url: {ModuleName}Url);

      return right(BaseModel.fromJson(response.data));
    } on CustomException catch (ex) {
      return Left(CustomError(
          type: ex.type, errorMassage: ex.errorMassage, imgPath: ex.imgPath));
    }
  }

  @override
  Future<Either<CustomError, SuccessModel>> delete{Module}(
      {required {Module}Model {ModuleName}Id}) async {
    try {
      ///todo: write you api key here

      String {ModuleName}Url = '';
      await DioHelper.deleteData(url: {ModuleName}Url);

      return right(SuccessModel());
    } on CustomException catch (ex) {
      return Left(CustomError(
          type: ex.type, errorMassage: ex.errorMassage, imgPath: ex.imgPath));
    }
  }
}
""";