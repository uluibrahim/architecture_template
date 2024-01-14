enum ApiHeaderValue {
  applicationJson('application/json'),
  _bearer('Bearer ');

  final String value;
  const ApiHeaderValue(this.value);

  static String bearerToken(String value) {
    return ApiHeaderValue._bearer.value + value;
  }
}
