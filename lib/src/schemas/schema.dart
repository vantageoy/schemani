import 'package:schemani/src/rules/rule.dart';

/// Error thrown on invalid schema structure.
///
/// This error should be handled by the developer, not catched.
class SchemaValidationError extends Error {
  final String message;

  SchemaValidationError(this.message);
}

/// A value schema containing set of rules.
///
/// The given rules are ran during validation.
class Schema<T> {
  final List<Rule<T>> rules;

  const Schema([this.rules = const []]);

  /// Validate the given value(s).
  ///
  /// The given rules throws an ValidationException if the test doesn't pass.
  void validate(T value) {
    rules.forEach((rule) => rule.test(value));
  }
}
