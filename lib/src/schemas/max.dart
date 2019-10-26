import 'package:schemani/schemani.dart';
import 'package:schemani/src/schema.dart';
import 'package:schemani/src/validation_exception.dart';

/// Exception thrown on number too high.
class MaximumNumberException extends ValidationException {
  const MaximumNumberException() : super('The value is more than accepted');
}

/// A rule for validating maximum number value.
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
