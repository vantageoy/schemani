/// Simple and extensible data schema validation for Dart and Flutter.
///
/// [Schema]s describes a set of [Rule]s for a value. [Schema]s validates
/// values againsts the [Rule]s and throws an [ValidationException] on the
/// first validation error.
///
/// Some [Schema]s are combined from a set of another [Schema]s. In this case
/// all the [Schema]s are run and then thrown combined.
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

import 'package:schemani/src/rules/rule.dart';
import 'package:schemani/src/schemas/schema.dart';
import 'package:schemani/src/validation_exception.dart';

export 'package:schemani/src/rules/email.dart';
export 'package:schemani/src/rules/required.dart';
export 'package:schemani/src/rules/rule.dart';
export 'package:schemani/src/schemas/map.dart';
export 'package:schemani/src/schemas/schema.dart';
export 'package:schemani/src/validation_exception.dart';
