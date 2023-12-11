import 'package:dcli/dcli.dart';
import 'package:generator/module/data/data_source/remote_data_source.dart'
    as generator_data_source;
import 'package:generator/module/data/repository/repository.dart'
    as generator_repository;
import 'package:generator/module/domain/repository/repository_interface.dart'
    as generator_repository_interface;
import 'package:generator/module/domain/ues_cases/module_ues_cases.dart'
    as generator_use_case;
import 'package:generator/module/domain/model/model.dart' as generator_model;

import 'package:generator/module/presentation/logic/cubit.dart'
    as generator_cubit;
import 'package:generator/module/presentation/logic/states.dart'
    as generator_state;
import 'package:generator/module/presentation/screen.dart' as generator_screen;
import 'package:generator/src/utilities/string_extension.dart';
import 'utilities/utils.dart';

String moduleName = "";
String modulePath = "";

///
String dataFolderPath = "";
String dataSourcePath = "";
String repositoryInterfacePath = "";

///
String domainFolderPath = "";
String repoInterfacePath = "";
String modelPath = "";
String useCasePath = "";

///
String presentationFolderPath = "";

String logicPath = "";
String screenPath = "";

Future<void> generate(List<String> args) async {
  /// Assign variable values
  if (!_validateArgs(args)) return;

  moduleName = args.first;
  modulePath =
      "lib/features/${moduleName.formatFeatureName()}";

  Utils.makeDir(modulePath);

  /// Generate data layer
  await generateDataLayer();

  /// Generate domain layer
  await generateDomainLayer();
  await generatePresentationLayer();
}

/// Generate ModuleController
Future<void> generateDataLayer() async {
  dataFolderPath =
      "lib/features/${moduleName.formatFeatureName()}/data";
  dataSourcePath = "$dataFolderPath/data_source";
  repositoryInterfacePath = "$dataFolderPath/repository";

  ///generate data folder in feature
  Utils.makeDir(dataFolderPath);

  ///generate data source folder in data folder
  Utils.makeDir(dataSourcePath);

  ///generate data source file in data folder
  String dataSourceFile = generator_data_source.stub
      .replaceAll('{ModuleName}', moduleName.capitalizeFirstLetter(preserveAfter: true))
      .replaceAll('{Module}', moduleName.capitalizeFirstLetter(preserveAfter: true));
  Utils.writeFile(
      "$dataSourcePath/${moduleName.capitalizeFirstLetter(preserveAfter: true)}_remote_data_source.dart",
      dataSourceFile);
  Utils.makeDir(repositoryInterfacePath);
  String repositoryFile = generator_repository.stub
      .replaceAll('{ModuleName}', moduleName.capitalizeFirstLetter(preserveAfter: true))
      .replaceAll('{Module}', moduleName.capitalizeFirstLetter(preserveAfter: true));

  /// Write File

  Utils.writeFile(
      "$repositoryInterfacePath/${moduleName.capitalizeFirstLetter(preserveAfter: true)}_repository_impl.dart",
      repositoryFile);
  Utils.debugPrint(
      green('"$dataFolderPath" data layer generated successfully!'));
}

/// Generate domain layer
Future<void> generateDomainLayer() async {
  domainFolderPath =
      "lib/features/${moduleName.formatFeatureName()}/domain";
  modelPath = "$domainFolderPath/model";
  repositoryInterfacePath = "$domainFolderPath/repository";
  useCasePath = "$domainFolderPath/use_cases";

  ///generate domain folder in feature
  Utils.makeDir(domainFolderPath);

  ///generate repo interface folder
  Utils.makeDir(repositoryInterfacePath);
  String repoInterfaceFile = generator_repository_interface.stub
      .replaceAll('{ModuleName}', moduleName.capitalizeFirstLetter(preserveAfter: true))
      .replaceAll('{Module}', moduleName.capitalizeFirstLetter(preserveAfter: true));
  Utils.writeFile(
      "$repositoryInterfacePath/${moduleName.capitalizeFirstLetter(preserveAfter: true)}_repository_interface.dart",
      repoInterfaceFile);

  ///generate  model folder
  Utils.makeDir(modelPath);
  String modelFile = generator_model.stub
      .replaceAll('{ModuleName}', moduleName.capitalizeFirstLetter(preserveAfter: true))
      .replaceAll('{Module}', moduleName.capitalizeFirstLetter(preserveAfter: true));
  Utils.writeFile(
      "$modelPath/${moduleName.capitalizeFirstLetter(preserveAfter: true)}_model.dart",
      modelFile);

  ///generate  use case folder

  Utils.makeDir(useCasePath);
  String useCaseFile = generator_use_case.stub
      .replaceAll('{ModuleName}', moduleName.capitalizeFirstLetter(preserveAfter: true))
      .replaceAll('{Module}', moduleName.capitalizeFirstLetter(preserveAfter: true));
  Utils.writeFile(
      "$useCasePath/${moduleName.capitalizeFirstLetter(preserveAfter: true)}_use_case.dart",
      useCaseFile);

  /// Show Success message
  Utils.debugPrint(
      green('"$domainFolderPath" domain layer generated successfully!'));
}

Future<void> generatePresentationLayer() async {
  presentationFolderPath =
      "lib/features/${moduleName.formatFeatureName()}/presentation";
  logicPath = "$presentationFolderPath/logic";
  screenPath = presentationFolderPath;

  ///generate domain folder in feature
  Utils.makeDir(presentationFolderPath);

  ///generate repo interface folder
  Utils.makeDir(logicPath);
  String cubitFile = generator_cubit.stub
      .replaceAll('{ModuleName}', moduleName.capitalizeFirstLetter(preserveAfter: true))
      .replaceAll('{Module}', moduleName.capitalizeFirstLetter(preserveAfter: true));
  Utils.writeFile(
      "$logicPath/${moduleName.capitalizeFirstLetter(preserveAfter: true)}_cubit.dart",
      cubitFile);
  String stateFile = generator_state.stub
      .replaceAll('{ModuleName}', moduleName.capitalizeFirstLetter(preserveAfter: true))
      .replaceAll('{Module}', moduleName.capitalizeFirstLetter(preserveAfter: true));
  Utils.writeFile(
      "$logicPath/${moduleName.capitalizeFirstLetter(preserveAfter: true)}_states.dart",
      stateFile);

  ///generate  model folder
  String screenFile = generator_screen.stub
      .replaceAll('{ModuleName}', moduleName.capitalizeFirstLetter(preserveAfter: true))
      .replaceAll('{Module}', moduleName.capitalizeFirstLetter(preserveAfter: true));
  Utils.writeFile(
      "$presentationFolderPath/${moduleName.capitalizeFirstLetter(preserveAfter: true)}_screen.dart",
      screenFile);

  /// Show Success message
  Utils.debugPrint(green(
      '"$presentationFolderPath" presentation layer generated successfully!'));
}

bool _validateArgs(List<String> args) {
  /// Check if there are any args
  if (args.isEmpty) {
    Utils.debugPrint(red(
        'Please provide feature name \nExample "flutter pub run generator:generate featureName '));

    return false;
  }
  return true;
}
