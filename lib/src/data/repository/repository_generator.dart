import 'package:dcli/dcli.dart';
import 'package:generator/module/data/repository/repository.dart' as data_source_generator;

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

  controllerPath = "lib/${Utils.ucFirst(moduleName, preserveAfter: true)}/data/data_source";

  /// Generate Controller
  await generateDataSource();
}

/// Generate ModuleController
Future<void> generateDataSource() async {
  /// Check and create directory
  Utils.makeDir(controllerPath);

  String controllerFile = data_source_generator.stub.replaceAll('{CONTROLLER}', Utils.ucFirst(controllerName, preserveAfter: true));

  /// Write File
  Utils.writeFile("$controllerPath/${Utils.ucFirst(controllerName, preserveAfter: true)}Controller.dart", controllerFile);

  /// Show Success message
  Utils.debugPrint(green('"$controllerPath/${Utils.ucFirst(controllerName, preserveAfter: true)}Controller.dart" generated successfully.'));
}

bool _validateArgs(List<String> args) {
  /// Check if there are any args
  if (args.isEmpty) {
    Utils.debugPrint(red('Please provide controller name and module name\nExample "flutter pub run generator:controller ControllerName --on=module_name"'));
    return false;
  }

  /// Get the module name
  moduleName = args.where((element) => element.contains('--on=')).isNotEmpty ? args.where((element) => element.contains('--on=')).first : "";

  /// Check if the module name is provided or not.
  if (moduleName == "") {
    Utils.debugPrint(red('Please provide module name to generate the controller\nExample [--on=<module_name>]'));
    return false;
  }

  /// Assign module name
  moduleName = moduleName.replaceAll('--on=', '');

  /// Assign module path
  modulePath = "lib/${Utils.ucFirst(moduleName, preserveAfter: true)}";

  /// Check if the module exists or not
  if (!exists(modulePath)) {
    Utils.debugPrint(red('The module with name "$moduleName" does not exist.'));
    return false;
  }
  return true;
}
