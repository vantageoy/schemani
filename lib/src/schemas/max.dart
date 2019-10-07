import 'package:schemani/schemani.dart';
import 'package:schemani/src/schema.dart';
import 'package:schemani/src/validation_exception.dart';

class MaximumNumberException extends ValidationException {
  const MaximumNumberException() : super('The value is more than accepted');
}

class Max<T extends num> extends Schema<T> {
  final T max;

  const Max(this.max);

  @override
  validate(value) {
    if (value > max) {
      throw const MaximumNumberException();
    }
  }
}
