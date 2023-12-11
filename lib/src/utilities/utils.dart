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

  //
  //
  // /// Convert String to have first letter in small
  // static String ucFirst(String text, {bool preserveAfter = false}) {
  //   if (preserveAfter) {
  //     return text.trim()[0].toUpperCase() + text.substring(1);
  //   }
  //   return text.trim()[0].toUpperCase() + text.substring(1).toUpperCase();
  // }
  // static String lcFirst(String text, {bool preserveAfter = false}) {
  //   if (preserveAfter) {
  //     return text.trim()[0].toLowerCase() + text.substring(1);
  //   }
  //   return text.trim()[0].toLowerCase() + text.substring(1).toLowerCase();
  // }
  //
  // /// Convert String to each word's first letter caps
  // static String ucWords(String text) {
  //   return text.trim().split(' ').map((e) => ucFirst(e)).join(' ');
  // }
  //
  // /// Convert String to [snake_case]
  // static String snake(String text) {
  //   return text.split(' ').map((element) => element.toLowerCase()).join('_');
  // }
  //
  // /// Convert String to [kebab-case]
  // static String kebab(String text) {
  //   return text.trim().split(' ').map((element) => element.toLowerCase()).join('-');
  // }
  //
  // /// Convert String to [snake_case]
  // static String camel(String text) {
  //   return text.split(' ').map((element) => ucFirst(element)).join('');
  // }
  //
  // /// Check if string contains provided character or word
  // static String replaceAll(String text, dynamic needle) {
  //   return text.replaceAll('.', needle);
  // }


  static debugPrint(String message) {
    stderr.writeln(message);
    // Additional debug-only logic can be added here
  }
}
