enum ServicePath {
  login('login'),
  register('register');

  final String value;
  const ServicePath(this.value);

  String withQuery(String qValue) {
    return '$value/$qValue';
  }
}
