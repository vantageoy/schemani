import 'package:schemani/rule.dart';

class Schema<T> {
  final List<Rule<T>> rules;

  const Schema([this.rules = const []]);

  void validate(T value) {
    rules.forEach((rule) => rule.test(value));
  }
}
