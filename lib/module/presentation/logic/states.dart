

const String stub = """
import '/features/{ModuleName}_feature/domain/model/{ModuleName}_model.dart';

import '/core/error_handling/custom_error.dart';

abstract class {Module}States {}

class {Module}StateInit extends {Module}States {}

class {Module}LoadingState extends {Module}States {}

class {Module}LoadingMoreDateState extends {Module}States {}

class {Module}EmptyState extends {Module}States {}

class {Module}SuccessState extends {Module}States {}

class {Module}SuccessMoreDateState extends {Module}States {}

class {Module}ErrorMoreDateState extends {Module}States {
  CustomError? error;

  {Module}ErrorMoreDateState({
    this.error,
  });
}

class {Module}ErrorState extends {Module}States {
  CustomError? error;

  {Module}ErrorState({
    this.error,
  });
}

class Delete{Module}LoadingState extends {Module}States {}

class Delete{Module}SuccessState extends {Module}States {}

class Delete{Module}ErrorState extends {Module}States {
  CustomError? error;

  Delete{Module}ErrorState({
    this.error,
  });
}

class Get{Module}ItemDetailsLoadingState extends {Module}States {}

class Get{Module}ItemDetailsSuccessState extends {Module}States {}

class Get{Module}ItemDetailsErrorState extends {Module}States {
  CustomError? error;

  Get{Module}ItemDetailsErrorState({
    this.error,
  });
}

""";

