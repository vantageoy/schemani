import 'package:flutter_test/flutter_test.dart';
import 'package:schemani/rules/rule.dart';
import 'package:schemani/schemas/schema.dart';
import 'package:schemani/validation_exception.dart';

class TestValidationExpection extends ValidationException {
  const TestValidationExpection();
}

class TestRule extends Rule<String> {
  const TestRule();

  test(value) {
    if (value == 'bar') {
      throw const TestValidationExpection();
    }
  }
}

void main() {
  test('it should test the given rules', () {
    const schema = Schema([TestRule()]);

    expect(() => schema.validate('bar'), throwsException);

    try {
      schema.validate('foo');
    } on ValidationException {
      fail('Schema should have passed');
    }
  });
}
