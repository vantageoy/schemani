import 'package:schemani/src/schema.dart';
import 'package:schemani/src/schemas/email.dart';
import 'package:schemani/src/schemas/map.dart';
import 'package:schemani/src/schemas/required.dart';
import 'package:schemani/src/validation_exception.dart';
import 'package:test/test.dart';

void main() {
  test('validates inner schemas', () {
    const schema = MapSchema({
      "email": Schema([Required(), Email()]),
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
      "email": Schema([Required(), Email()]),
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
      "email": Schema([Required()]),
    });

    try {
      schema.validate({});
    } on MapValidationException catch (e) {
      return expect(e.exceptions['email'] is RequiredValidationException, true);
    }

    fail('Expected required validation to throw.');
  });

  test('nested map schemas', () {
    const schema = MapSchema({
      "email": Schema([Required()]),
      "profile": MapSchema({
        "name": MapSchema({
          "first_name": Schema([Required()]),
          "last_name": Schema([Required()]),
        }),
      }),
    });

    const invalidValues = <Map<String, dynamic>>[
      {},
      {'profile': null},
      {'email': 'foo@example.org'},
      {
        'profile': {'name': null}
      }
    ];

    for (final values in invalidValues) {
      try {
        schema.validate(values);
      } on MapValidationException catch (e) {
        expect(e.exceptions['profile'] is MapValidationException, true);
        MapValidationException profile = e.exceptions['profile'];

        expect(profile.exceptions['name'] is MapValidationException, true);
        MapValidationException name = profile.exceptions['name'];

        expect(
            name.exceptions['first_name'] is RequiredValidationException, true);

        continue;
      }

      fail('Expected validations to throw.');
    }
  });
}
