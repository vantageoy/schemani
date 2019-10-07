import 'package:schemani/schemani.dart';
import 'package:schemani/src/schema.dart';
import 'package:schemani/src/validation_exception.dart';

/// Exception thrown on invalid email address.
class EmailValidationException extends ValidationException {
  const EmailValidationException() : super('Invalid email address');
}

/// A rule for validating email addresses.
///
/// Please note that this rule should only be used for UX purposes.
/// This is not bulletproof validation. See https://emailregex.com/
class Email extends Schema<String> {
  /// The regex used to validate the emails.
  static final regex = new RegExp(
      r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  const Email();

  @override
  validate(value) {
    if (!regex.hasMatch(value)) {
      throw const EmailValidationException();
    }
  }
}
