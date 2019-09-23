# schemani

Simple and extensible data schema validation for Dart and Flutter. If you know [Yup](https://github.com/jquense/yup) and [Laravel Validation](https://laravel.com/docs/validation#available-validation-rules) you will feel like home using this package.

Please note that the schemani/formini packages are under development. There are still some issues to resolve before this has any help for real use cases. [#roadmap](#roadmap)

## Usage

```dart
import 'package:schemani/schemani.dart';

main() {
  const userSchema = MapSchema({
    'name': [Required()],
    'email': [Required(), Email()],
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
```
Will throw `MapValidationException` only once combining the inner `ValidationException`s.
```
flutter: name => Required field
flutter: email => Invalid email address
```

### Usage with `formini`

Use [formini-schemani](https://pub.dev/packages/formini-schemani) package for validating [formini](https://pub.dev/packages/formini) values using schemas. Or just copy the one simple file to your project.

## API reference

https://pub.dev/documentation/schemani

## Contributing

Please open an issue or pull request in GitHub. Any help and feedback is much appreciated.

## Licence

MIT

## Roadmap

- `ListSchema`
- Rules
    - References to another fields inside a rule
    - More basic rules (min, max, between, url, etc...)
- i18n `ValidationException.toString()`
