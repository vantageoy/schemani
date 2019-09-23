import 'package:schemani/src/rules/rule.dart';
import 'package:schemani/src/validation_exception.dart';

class EmailValidationException extends ValidationException {
  const EmailValidationException() : super('Invalid email address');
}

class Email extends Rule<String> {
  static final regex = new RegExp(
      r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  const Email();

  test(value) {
    if (!regex.hasMatch(value)) {
      throw const EmailValidationException();
    }
  }
}
