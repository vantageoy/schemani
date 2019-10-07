import 'package:schemani/schemani.dart';
import 'package:schemani/src/schema.dart';
import 'package:schemani/src/validation_exception.dart';

class MinimumNumberException extends ValidationException {
  const MinimumNumberException() : super('The value is less than accepted');
}

class Min<T extends num> extends Schema<T> {
  final T min;

  const Min(this.min);

  @override
  validate(value) {
    if (value < min) {
      throw const MinimumNumberException();
    }
  }
}
