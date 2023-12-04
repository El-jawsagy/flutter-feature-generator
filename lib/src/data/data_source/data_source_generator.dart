import 'package:dcli/dcli.dart';
import 'package:generator/module/data/data_source/remote_data_source.dart'
    as data_source_generator;

import '../../utilities/utils.dart';

String moduleName = "";
String modulePath = "";
String dataSourceName = "";
String dataSourcePath = "";

Future<void> generate(List<String> args) async {
  /// Validate arguments
  if (!_validateArgs(args)) return;

  /// Assign variable values
  dataSourceName = args.first;

  dataSourcePath =
      "lib/${Utils.ucFirst(moduleName, preserveAfter: true)}/data/data_source";

  /// Generate Controller
  await generateDataSource();
}

/// Generate ModuleController
Future<void> generateDataSource() async {
  /// Check and create directory
  Utils.makeDir(dataSourcePath);

  String controllerFile = data_source_generator.stub.replaceAll(
      '{DATASOURCE_NAME}', Utils.ucFirst(dataSourceName, preserveAfter: true));

  /// Write File
  Utils.writeFile(
      "$dataSourcePath/${Utils.ucFirst(dataSourceName, preserveAfter: true)}_remote_data_source.dart",
      controllerFile);

  /// Show Success message
  Utils.debugPrint(green(
      '"$dataSourcePath/${Utils.ucFirst(dataSourceName, preserveAfter: true)}_remote_data_source.dart" generated successfully.'));
}

bool _validateArgs(List<String> args) {
  /// Check if there are any args
  if (args.isEmpty) {
    Utils.debugPrint(red(
        'Please provide Data Source name and module name\nExample "flutter pub run generator:dataSource dataSourceName --on=module_name"'));

    return false;
  }

  /// Get the module name
  moduleName = args.where((element) => element.contains('--on=')).isNotEmpty
      ? args.where((element) => element.contains('--on=')).first
      : "";

  /// Check if the module name is provided or not.
  if (moduleName == "") {
    Utils.debugPrint(red(
        'Please provide module name to generate the  Data Source \nExample [--on=<module_name>]'));
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
