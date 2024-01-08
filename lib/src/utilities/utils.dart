import 'dart:io';

import 'package:dcli/dcli.dart';

class Utils {
  static void makeDir(path) {
    if (!exists(path)) {
      createDir(path, recursive: true);
    }
  }

  static void writeFile(file, content) {
    "$file".write(content);
  }


  static debugPrint(String message) {
    stderr.writeln(message);
    // Additional debug-only logic can be added here
  }
}
