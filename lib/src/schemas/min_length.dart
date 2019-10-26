import 'package:schemani/schemani.dart';
import 'package:schemani/src/schema.dart';
import 'package:schemani/src/validation_exception.dart';

class MinLengthException extends ValidationException {
  const MinLengthException() : super('The value is shorter than accepted');
}

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
