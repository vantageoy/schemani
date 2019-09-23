import 'package:flutter_test/flutter_test.dart';
import 'package:schemani/schema_validation_error.dart';
import 'package:schemani/schemas/map.dart';

void main() {
  test('it has a message field', () {
    expect(
      SchemaValidationError('Something went wrong').message,
      'Something went wrong',
    );
  });

  test('it is not catched during Schema.validation', () {
    try {
      MapSchema({
        "foo": "invalid schema description",
      }).validate({'foo': 'bar'});
    } on SchemaValidationError {} catch (e) {
      fail('Caught something else than SchemaValidationError, $e');
    }
  });
}
