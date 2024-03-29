import 'package:schemani/src/validation_exception.dart';
import 'package:test/test.dart';

class _DummyValidationException extends ValidationException {
  const _DummyValidationException();
}

class _MessageValidationException extends ValidationException {
  const _MessageValidationException() : super('Foo');
}

void main() {
  test('it has a default toString() method', () {
    expect(_DummyValidationException().toString(), '_DummyValidationException');
  });

  test('it accepts a message attribute', () {
    expect(_MessageValidationException().toString(), 'Foo');
  });
}
