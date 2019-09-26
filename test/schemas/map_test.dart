import 'package:schemani/src/rules/email.dart';
import 'package:schemani/src/rules/required.dart';
import 'package:schemani/src/rules/rule.dart';
import 'package:schemani/src/schemas/map.dart';
import 'package:schemani/src/schemas/schema.dart';
import 'package:schemani/src/validation_exception.dart';
import 'package:test/test.dart';

void main() {
  test('validates inner schemas', () {
    const schema = MapSchema({
      "email": Schema(<Rule>[Required(), Email()]),
    });

    expect(() => schema.validate({}), throwsException);
    expect(() => schema.validate({'email': 'foo'}), throwsException);

    try {
      schema.validate({'email': 'valid-email@example.org'});
    } on ValidationException {
      fail('Example schema validation should have passed valid data.');
    }
  });

  test('allows array shorthand schema description', () {
    const schema = MapSchema({
      "email": [Required(), Email()],
    });

    expect(() => schema.validate({}), throwsException);

    try {
      schema.validate({'email': 'valid-email@example.org'});
    } on ValidationException {
      fail('Example schema validation should have passed valid data.');
    }
  });

  test('MapValidationException has validation errors in key->exception', () {
    const schema = MapSchema({
      "email": [Required()],
    });

    try {
      schema.validate({});
    } on MapValidationException catch (e) {
      return expect(e.exceptions['email'] is RequiredValidationException, true);
    }

    fail('Expected required validation to throw.');
  });
}
