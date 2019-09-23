import 'package:schemani/src/schemas/description/parser.dart';
import 'package:schemani/src/schemas/schema.dart';
import 'package:schemani/src/validation_exception.dart';

/// Exception thrown when any of the inner schemas doesn't pass the validation test.
class MapValidationException extends ValidationException {
  /// Contains a map of failed schema validation tests.
  ///
  /// The keys are the same as given schema map.
  /// The values are the exceptions.
  /// Only contains pairs that did not pass the test.
  final Map<String, ValidationException> exceptions;

  const MapValidationException(this.exceptions);
}

/// Specify a schema for every value in the map.
class MapSchema<T extends Map<String, dynamic>> extends Schema<T> {
  /// The key->schema mapping.
  final Map<String, dynamic> schemas;

  const MapSchema(this.schemas);

  @override
  validate(values) {
    final exceptions = <String, ValidationException>{};

    schemas.forEach((key, schema) {
      try {
        SchemaDescriptionParser.parse(schema).validate(values[key]);
      } on ValidationException catch (exception) {
        exceptions[key] = exception;
      }
    });

    if (exceptions.isNotEmpty) {
      throw MapValidationException(exceptions);
    }
  }
}
