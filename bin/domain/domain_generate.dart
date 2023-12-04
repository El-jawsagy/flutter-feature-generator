#! /usr/bin/env dcli

import 'package:generator/src/data/data_source/data_source_generator.dart'
    as data_source_generator;
import 'package:generator/src/data/repository/repository_generator.dart'
    as repository_generator;

void main(List<String> args) {
  data_source_generator.generate(args);
  repository_generator.generate(args);
}
