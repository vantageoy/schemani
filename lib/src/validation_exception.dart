/// Exception thrown when the value doesn't pass a validation test.
abstract class ValidationException implements Exception {
  final String message;

  const ValidationException([this.message]);

  @override
  String toString() => message ?? runtimeType.toString();
}
