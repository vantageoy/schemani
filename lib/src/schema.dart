/// A value schema containing set of rules.
///
/// The given rules are ran during validation.
class Schema<T> {
  final Iterable<Schema<T>> _schemas;

  const Schema([this._schemas = const []]);

  /// Validate the given value(s).
  ///
  /// The given schemas throws an ValidationException if the test doesn't pass.
  void validate(T value) {
    _schemas.forEach((rule) => rule.validate(value));
  }

  call(T value) {
    return validate(value);
  }
}
