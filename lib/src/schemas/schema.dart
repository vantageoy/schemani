import 'package:schemani/src/rules/rule.dart';

/// A value schema containing set of rules.
///
/// The given rules are ran during validation.
class Schema<T> {
  final Iterable<Rule<T>> rules;

  const Schema([this.rules = const []]);

  /// Validate the given value(s).
  ///
  /// The given rules throws an ValidationException if the test doesn't pass.
  void validate(T value) {
    rules.forEach((rule) => rule.test(value));
  }
}
