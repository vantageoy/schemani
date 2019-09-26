/// The base Rule contract.
abstract class Rule<T> {
  const Rule();

  /// Test the value against the validation rules.
  ///
  /// Throws an [ValidationException] when the value doesn't pass the test.
  void test(T value);
}
