import 'package:schemani/schemani.dart';
import 'package:schemani/src/validation_exception.dart';
import 'package:test/test.dart';

void main() {
  test('disallows values below 100', () {
    final rule = const Min<int>(100);

    [0, 90].forEach((value) {
      expect(
        () => rule.validate(value),
        throwsException,
        reason: 'Value $value should not pass the requirement test',
      );
    });
  });

  test('allows values 100 and above', () {
    final rule = const Min<int>(100);

    [
      100,
      101,
    ].forEach((value) {
      try {
        rule.validate(value);
      } on ValidationException {
        fail('Value $value should pass requirement test');
      }
    });
  });
}
