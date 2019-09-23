import 'package:flutter_test/flutter_test.dart';
import 'package:schemani/src/rules/rule.dart';
import 'package:schemani/src/schemas/description/parser.dart';
import 'package:schemani/src/schemas/map.dart';
import 'package:schemani/src/schemas/schema.dart';

class _TestRule extends Rule {
  @override
  void test(value) {}
}

class _FooRule extends Rule<String> {
  @override
  void test(value) {}
}

void main() {
  /// Alias for shorter usage.
  const parse = SchemaDescriptionParser.parse;

  test('it should parse valid descriptions', () {
    expect(parse(Schema([_TestRule()])) is Schema, true);
    expect(parse([_TestRule()]) is Schema, true);
    expect(parse([_TestRule(), _FooRule()]) is Schema, true);
    expect(parse(<Rule>[]) is Schema, true);
    expect(parse([]) is Schema, true);
  });

  test('it should not parse invalid descriptions', () {
    expect(() => parse(['foo']), throwsArgumentError);
    expect(() => parse(null), throwsArgumentError);
    expect(() => parse(_TestRule()), throwsArgumentError);
  });

  test('it is not catched during Schema.validation', () {
    try {
      MapSchema({
        "foo": "invalid schema description",
      }).validate({'foo': 'bar'});
    } on SchemaDescriptionError {} catch (e) {
      fail('Caught something else than SchemaDescriptionError, $e');
    }
  });
}
