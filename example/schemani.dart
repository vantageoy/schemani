import 'package:schemani/schemani.dart';

void main() {
  const userSchema = MapSchema({
    'name': Schema([Required()]),
    'email': Schema([Required(), Email()]),
    'profile': MapSchema({
      'avatar': Schema([Required()]),
    }),
  });

  try {
    userSchema.validate({'name': null, 'email': 'example.org'});
  } on MapValidationException catch (e) {
    handle(e);
  }
}

/// MapValidationExceptions handler.
handle(MapValidationException e) {
  e.exceptions.forEach((field, exception) {
    if (exception is MapValidationException) {
      return handle(exception);
    }

    print('$field => $exception');
  });
}
