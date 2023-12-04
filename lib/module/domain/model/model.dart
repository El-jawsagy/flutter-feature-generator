const String stub = """
import 'package:flutter/cupertino.dart';
import '/core/constants/enums/exception_enums.dart';
import '/core/error_handling/custom_exception.dart';

List<{Module}Model> {ModuleName}ListFromJson(List str) =>
    List<{Module}Model>.from(str.map((x) => {Module}Model.fromJson(x)));

class {Module}Model {
  {Module}Model();

  factory {Module}Model.fromJson(Map<String, dynamic> json) {
    try {
      return {Module}Model();
    } catch (e) {
      debugPrint("error when parsing review {ModuleName} model: \${e.toString()}");
      throw CustomException(CustomStatusCodeErrorType.parsing, "",
          errorMassage: e.toString());   
    }
  }
}
""";
