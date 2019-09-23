import 'package:schemani/src/rules/rule.dart';

class SchemaValidationError extends Error {
  final String message;

  SchemaValidationError(this.message);
}

class Schema<T> {
  final List<Rule<T>> rules;

  const Schema([this.rules = const []]);

  void validate(T value) {
    rules.forEach((rule) => rule.test(value));
  }
}
