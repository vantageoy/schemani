import 'package:flutter_test/flutter_test.dart';
import 'package:schemani/src/rules/rule.dart';
import 'package:schemani/src/validation_exception.dart';

class _TestValidationExpection extends ValidationException {
  const _TestValidationExpection();
}

class _TestRule extends Rule<String> {
  const _TestRule();

  test(value) {
    if (value == 'bar') {
      throw const _TestValidationExpection();
    }
  }
}

void main() {
  test('it should not throw when the test passes', () {
    try {
      _TestRule().test('foo');
    } on ValidationException {
      fail('_TestRule should have not thrown an error');
    }
  });

  test('it should throw when the test does not pass', () {
    expect(() => _TestRule().test('bar'), throwsException);
  });
}
