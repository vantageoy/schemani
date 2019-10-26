import 'package:schemani/schemani.dart';
import 'package:schemani/src/schema.dart';
import 'package:schemani/src/validation_exception.dart';

/// Exception thrown on string too long.
class MaxLengthException extends ValidationException {
  const MaxLengthException() : super('The value is longer than accepted');
}

/// A rule for validating maximum string length.
class MaxLength<T extends String> extends Schema<T> {
  final int maxLength;

  const MaxLength(this.maxLength);

  @override
  validate(value) {
    if (value.length > maxLength) {
      throw const MaxLengthException();
    }
  }
}
