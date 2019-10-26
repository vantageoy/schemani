import 'package:schemani/schemani.dart';
import 'package:schemani/src/schema.dart';
import 'package:schemani/src/validation_exception.dart';

/// Exception thrown on string too short.
class MinLengthException extends ValidationException {
  const MinLengthException() : super('The value is shorter than accepted');
}

/// A rule for validating minimum string length.
class MinLength<T extends String> extends Schema<T> {
  final int minLength;

  const MinLength(this.minLength);

  @override
  validate(value) {
    if (value.length < minLength) {
      throw const MinLengthException();
    }
  }
}
