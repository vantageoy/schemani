import 'package:flutter_test/flutter_test.dart';
import 'package:schemani/validation_exception.dart';

class DummyValidationException extends ValidationException {
  const DummyValidationException();
}

class MessageValidationException extends ValidationException {
  const MessageValidationException() : super('Foo');
}

void main() {
  test('it has a default toString() method', () {
    expect(DummyValidationException().toString(), 'DummyValidationException');
  });

  test('it accepts a message attribute', () {
    expect(MessageValidationException().toString(), 'Foo');
  });
}
