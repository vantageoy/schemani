class SchemaValidationError extends Error {
  final String message;

  SchemaValidationError(this.message);
}
