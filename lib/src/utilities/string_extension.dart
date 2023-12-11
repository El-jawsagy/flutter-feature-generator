extension StringExtensions on String {
  ///format user feature name
  String formatFeatureName() {
    // Use the StringExtensions extension to format the input
    String formattedInput = this
        .toLowerCase() //// Convert to lowercase
        .replaceSpecialCharWithSpace()
        .replaceAll(' ', '_') // Replace spaces with underscores
        .replaceAll('-', '_') // Replace dashes with underscores
        .extractModuleName() // Extract module name (remove '--on=')
        .decapitalizeFirstLetter(); // Convert to camelCase

    // Add "_feature" at the end if it doesn't already exist
    return formattedInput.endsWith('_feature'.toLowerCase())
        ? formattedInput
        : '$formattedInput\_feature';
  }

  String replaceSpecialCharWithSpace() {
    return this.replaceAll(RegExp(r'[^\w]+'), '_');
  }

  /// Capitalizes the first letter of the string.
  String capitalizeFirstLetter({bool preserveAfter = false}) {
    String trimmedString = this.trim();
    String firstCharUpperCased = trimmedString[0].toUpperCase();
    String restOfStringUpperCased = preserveAfter
        ? trimmedString.substring(1)
        : trimmedString.substring(1).toUpperCase();

    return firstCharUpperCased + restOfStringUpperCased;
  }

  /// Recapitalizes the first letter of the string.
  String decapitalizeFirstLetter({bool preserveAfter = false}) {
    String trimmedString = this.trim();
    String firstCharLowerCased = trimmedString[0].toLowerCase();
    String restOfStringLowerCased = preserveAfter
        ? trimmedString.substring(1)
        : trimmedString.substring(1).toLowerCase();

    return firstCharLowerCased + restOfStringLowerCased;
  }

  /// Capitalizes the first letter of each word in the string.
  String capitalizeWords() {
    return this
        .trim()
        .split(' ')
        .map((word) => word.capitalizeFirstLetter())
        .join(' ');
  }

  /// Converts the string to snake_case.
  String toSnakeCase() {
    return this.split(' ').map((element) => element.toLowerCase()).join('_');
  }

  /// Converts the string to kebab-case.
  String toKebabCase() {
    return this
        .trim()
        .split(' ')
        .map((element) => element.toLowerCase())
        .join('-');
  }

  /// Converts the string to camelCase.
  String toCamelCase() {
    return this
        .split(' ')
        .map((element) => element.capitalizeFirstLetter(preserveAfter: true))
        .join('');
  }

  /// Replaces all occurrences of a character or word in the string.
  String replaceAllOccurrences(dynamic needle) {
    return this.replaceAll('.', needle);
  }

  /// Extracts module name by replacing '--on=' in the string.
  String extractModuleName() {
    return this.replaceAll('--on=', '');
  }

  /// Converts the first letter of the string to lowercase.
  String toLowerCaseFirst() {
    return this.trim()[0].toLowerCase() + this.substring(1);
  }
}
