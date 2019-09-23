import 'package:schemani/src/rules/rule.dart';
import 'package:schemani/src/schemas/schema.dart';
import 'package:schemani/src/validation_exception.dart';

class MapValidationException extends ValidationException {
  final Map<String, ValidationException> exceptions;

  const MapValidationException(this.exceptions);
}

class MapSchema<T extends Map<String, dynamic>> extends Schema<T> {
  final Map<String, dynamic> schemas;

  const MapSchema(this.schemas);

  validate(values) {
    final exceptions = <String, ValidationException>{};

    schemas.forEach((key, schema) {
      try {
        final value = values[key];
        _getSchema(schema).validate(value);
      } on ValidationException catch (exception) {
        exceptions[key] = exception;
      }
    });

    if (exceptions.isNotEmpty) {
      throw MapValidationException(exceptions);
    }
  }

  /// Pluck the schema by key.
  Schema _getSchema(schema) {
    if (schema is Schema) {
      return schema;
    }

    // Shorthand <Rule>[...] for Schema(<Rule>[...]).
    if (schema is List) {
      return Schema(schema.whereType<Rule>().toList());
    }

    throw SchemaValidationError('Invalid MapSchema description');
  }
}