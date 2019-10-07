import 'package:schemani/src/schemas/required.dart';
import 'package:schemani/src/validation_exception.dart';
import 'package:test/test.dart';

void main() {
  final rule = const Required();

  test('disallows empty values', () {
    [null, '', {}, []].forEach((value) {
      expect(
        () => rule.validate(value),
        throwsException,
        reason: 'Value $value should not pass the requirement test',
      );
    });
  });

  test('allows nonempty values', () {
    [
      'foo',
      ' ',
      true,
      false,
      0,
      1,
      DateTime.now(),
      {'foo': 'bar'},
      [1],
    ].forEach((value) {
      try {
        rule.validate(value);
      } on ValidationException {
        fail('Value $value should pass requirement test');
      }
    });
  });
}
