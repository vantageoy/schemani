import 'package:schemani/schemani.dart';

void main() {
  const userSchema = MapSchema({
    'name': [Required()],
    'email': [Required(), Email()],
    'profile': MapSchema({
      'avatar': [Required()],
    }),
  });

  try {
    userSchema.validate({
      'name': null,
      'email': 'foo example.org',
    });
  } on MapValidationException catch (e) {
    e.exceptions.forEach((field, exception) {
      print('$field => $exception');
    });
  }
}
