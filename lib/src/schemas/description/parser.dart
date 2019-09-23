import 'package:schemani/src/rules/rule.dart';
import 'package:schemani/src/schemas/schema.dart';

/// Error thrown on invalid schema structure. Please fix.
class SchemaDescriptionError extends ArgumentError {
  /// The invalid schema description.
  final dynamic invalidValue;

  final String message =
      'The given schema description is invalid. Please check the correct formation from the package docs or API reference.';

  SchemaDescriptionError(this.invalidValue);
}

class SchemaDescriptionParser {
  /// Parse the [Schema] from the given schema description.
  ///
  // Allows using the shorthand <Rule>[...] for Schema(<Rule>[...]).
  static Schema parse(Object schema) {
    if (schema is Schema) {
      return schema;
    }

    if (schema is Iterable) {
      if (schema is Iterable<Rule>) {
        return Schema(schema);
      }

      /// Workaround for [Rule<int>, Rule] == List<Object> breaking the shorthand.

      final typed = schema.whereType<Rule>();

      if (typed.length == schema.length) {
        return Schema(typed);
      }
    }

    throw SchemaDescriptionError(schema);
  }
}
