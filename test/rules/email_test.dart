import 'package:schemani/src/rules/email.dart';
import 'package:schemani/src/validation_exception.dart';
import 'package:test/test.dart';

void main() {
  final rule = const Email();

  // Thanks https://en.wikipedia.org/wiki/Email_address

  test('disallows invalid email addresses', () {
    [
      'f', 'foo', 'foo@', 'foo@bar.', 'bar.biz',
      'Abc.example.com', // (no @ character)
      'A@b@c@example.com', // (only one @ is allowed outside quotation marks)
      'a"b(c)d,e:f;g<h>i[j\k]l@example.com', // (none of the special characters in this local-part are allowed outside quotation marks)
      'just"not"right@example.com', // (quoted strings must be dot separated or the only element making up the local-part)
      'this is"not\allowed@example.com', // (spaces, quotes, and backslashes may only exist when within quoted strings and preceded by a backslash)
      'this\ still\"not\\allowed@example.com', // (even if escaped (preceded by a backslash), spaces, quotes, and backslashes must still be contained by quotes)
      // '1234567890123456789012345678901234567890123456789012345678901234+x@example.com', // (local part is longer than 64 characters)
    ].forEach((value) {
      expect(
        () => rule.test(value),
        throwsException,
        reason: 'Should have thrown an exception on invalid email $value',
      );
    });
  });

  test('allows valid email addresses', () {
    [
      'simple@example.com',
      'very.common@example.com',
      'disposable.style.email.with+symbol@example.com',
      'other.email-with-hyphen@example.com',
      'fully-qualified-domain@example.com',
      'user.name+tag+sorting@example.com', // (may go to user.name@example.com inbox depending on mail server)
      'x@example.com', // (one-letter local-part)
      'example-indeed@strange-example.com',
      // 'admin@mailserver1', // (local domain name with no TLD, although ICANN highly discourages dotless email addresses)
      'example@s.example', // (see the List of Internet top-level domains)
      '" "@example.org', // (space between the quotes)
      '"john..doe"@example.org', // (quoted double dot)
    ].forEach((value) {
      try {
        rule.test(value);
      } on ValidationException {
        fail('Should have passed a valid email $value');
      }
    });
  });
}
