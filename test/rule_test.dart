import 'package:flutter_test/flutter_test.dart';
import 'package:schemani/rules/rule.dart';
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
  test('it should not throw when the test passes', () {
    try {
      TestRule().test('foo');
    } on ValidationException {
      fail('TestRule should have not thrown an error');
    }
  });

  test('it should throw when the test does not pass', () {
    expect(() => TestRule().test('bar'), throwsException);
  });
}
