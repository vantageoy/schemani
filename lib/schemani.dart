/// Simple and extensible data schema validation for Dart and Flutter.
///
/// ```dart
/// const userSchema = MapSchema({
///   'email': [Required(), Email()],
///   'profile': MapSchema({
///     'name' => [Required()],
///   }),
/// });
///
/// userSchema.validate({ 'email': 'foo' });
/// ```
library schemani;

export 'package:schemani/src/schema.dart';
export 'package:schemani/src/schemas/email.dart';
export 'package:schemani/src/schemas/map.dart';
export 'package:schemani/src/schemas/max.dart';
export 'package:schemani/src/schemas/max_length.dart';
export 'package:schemani/src/schemas/min.dart';
export 'package:schemani/src/schemas/min_length.dart';
export 'package:schemani/src/schemas/required.dart';
export 'package:schemani/src/schemas/shape.dart';
export 'package:schemani/src/validation_exception.dart';
