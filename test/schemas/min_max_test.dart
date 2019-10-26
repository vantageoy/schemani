import 'package:schemani/schemani.dart';
import 'package:schemani/src/validation_exception.dart';
import 'package:test/test.dart';

void main() {
  test('validates min - max int', () {
    final schema = const MapSchema({
      "age": Schema([Min<int>(18), Max<int>(33)]),
    });

    expect(() => schema.validate({'age': 17}), throwsException);
    expect(() => schema.validate({'age': 34}), throwsException);

    try {
      schema.validate({'age': 18});
    } on ValidationException {
      fail('Valid age should have passed');
    }
  });
}
