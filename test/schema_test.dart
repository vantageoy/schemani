import 'package:schemani/src/schema.dart';
import 'package:schemani/src/validation_exception.dart';
import 'package:test/test.dart';

class _TestValidationExpection extends ValidationException {
  const _TestValidationExpection();
}

class _TestRule extends Schema<String> {
  const _TestRule();

  test(value) {
    if (value == 'bar') {
      throw const _TestValidationExpection();
    }
  }
}

void main() {
  test('it should test the given rules', () {
    const schema = Schema([_TestRule()]);

    expect(() => schema.validate('bar'), throwsException);

    try {
      schema.validate('foo');
    } on ValidationException {
      fail('Schema should have passed');
    }
  });
}
