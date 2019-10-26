import 'package:schemani/schemani.dart';
import 'package:schemani/src/schemas/min_length.dart';
import 'package:schemani/src/validation_exception.dart';
import 'package:test/test.dart';

void main() {
  test('validates min length - max length string', () {
    final schema = const MapSchema({
      "password": Schema([MinLength<String>(8), MaxLength<String>(12)]),
    });

    expect(() => schema.validate({'password': 'foobaro'}), throwsException);
    expect(
        () => schema.validate({'password': 'foobarfoobaro'}), throwsException);

    try {
      schema.validate({'password': 'foobaroo'});
    } on ValidationException {
      fail('Valid password should have passed');
    }
  });
}
