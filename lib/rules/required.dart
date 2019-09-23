import 'package:schemani/rule.dart';
import 'package:schemani/validation_exception.dart';

class RequiredValidationException extends ValidationException {
  const RequiredValidationException() : super('Required field');
}

class Required extends Rule {
  const Required();

  test(value) {
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
