import 'package:schemani/schemani.dart';
import 'package:schemani/src/schema.dart';
import 'package:schemani/src/validation_exception.dart';

/// Thrown on missing or empty values that are required.
class RequiredValidationException extends ValidationException {
  const RequiredValidationException() : super('Required field');
}

/// Validate value exists and isn't empty.
class Required<T extends dynamic> extends Schema<T> {
  const Required();

  @override
  validate(value) {
    if (value == null) {
      throw const RequiredValidationException();
    }

    if (value is Map || value is List || value is String) {
      if (value.length == 0) {
        throw const RequiredValidationException();
      }
    }
  }
}
