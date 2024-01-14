part of '../network/api_client.dart';

// ignore: unused_field
enum _ApiHeaderValue {
  _applicationJson('application/json'),
  _bearer('Bearer ');

  final String value;
  const _ApiHeaderValue(this.value);
}
