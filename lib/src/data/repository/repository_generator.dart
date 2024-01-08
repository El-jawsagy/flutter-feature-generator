import 'package:dcli/dcli.dart';
import 'package:generator/module/data/repository/repository.dart'
    as data_source_generator;
import 'package:generator/src/utilities/string_extension.dart';

import '../../utilities/utils.dart';

String moduleName = "";
String modulePath = "";
String controllerName = "";
String controllerPath = "";

Future<void> generate(List<String> args) async {
  /// Validate arguments
  if (!_validateArgs(args)) return;

  /// Assign variable values
  controllerName = args.first;

  controllerPath =
      "lib/${moduleName.capitalizeFirstLetter(preserveAfter: true)}/data/data_source";

  /// Generate Controller
  await generateDataSource();
}

/// Generate ModuleController
Future<void> generateDataSource() async {
  /// Check and create directory
  Utils.makeDir(controllerPath);

  String controllerFile = data_source_generator.stub.replaceAll(
      '{CONTROLLER}', controllerName.capitalizeFirstLetter(preserveAfter: true));

  /// Write File
  Utils.writeFile(
      "$controllerPath/${controllerName.capitalizeFirstLetter(preserveAfter: true)}Controller.dart",
      controllerFile);

  /// Show Success message
  Utils.debugPrint(green(
      '"$controllerPath/${controllerName.capitalizeFirstLetter(preserveAfter: true)}Controller.dart" generated successfully.'));
}

bool _validateArgs(List<String> args) {
  /// Check if there are any args
  if (args.isEmpty) {
    Utils.debugPrint(red(
        'Please provide controller name and module name\nExample "flutter pub run generator:controller ControllerName --on=module_name"'));
    return false;
  }

  /// Get the module name
  moduleName = args.where((element) => element.contains('--on=')).isNotEmpty
      ? args.where((element) => element.contains('--on=')).first.extractModuleName()
      : "";

  /// Check if the module name is provided or not.
  if (moduleName == "") {
    Utils.debugPrint(red(
        'Please provide module name to generate the controller\nExample [--on=<module_name>]'));
    return false;
  }

  /// Assign module path
  modulePath = "lib/${moduleName.capitalizeFirstLetter(preserveAfter: true)}";

  /// Check if the module exists or not
  if (!exists(modulePath)) {
    Utils.debugPrint(red('The module with name "$moduleName" does not exist.'));
    return false;
  }
  return true;
}
