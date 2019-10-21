import 'package:schemani/src/schema.dart';
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
class MapSchema extends Schema<Map<String, Object>> {
  /// The key->schema mapping.
  final Map<String, Schema> _schemas;

  Map<String, Schema> get shape => _schemas;

  const MapSchema([this._schemas]);

  @override
  validate(values) {
    final exceptions = <String, ValidationException>{};

    shape.forEach((key, schema) {
      try {
        schema.validate(
          values != null && values.containsKey(key) ? values[key] : null,
        );
      } on ValidationException catch (exception) {
        exceptions[key] = exception;
      }
    });

    if (exceptions.isNotEmpty) {
      throw MapValidationException(exceptions);
    }
  }

  Schema operator [](String field) => shape[field];

  @override
  String toString() => 'MapSchema${shape.keys}';
}
