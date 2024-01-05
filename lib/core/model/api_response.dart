class ApiResponse {
  final bool isError;
  final String? errorMessage;
  final dynamic data;

  ApiResponse({
    required this.isError,
    this.errorMessage,
    this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        isError: json['is_error'] != null ? json['is_error'] as bool : true,
        errorMessage: json['error_message'] != null
            ? json['error_message'] as String
            : null,
        data: json['data'],
      );

  @override
  String toString() =>
      'ApiResponse(isError: $isError, errorMessage: $errorMessage, data: $data)';
}
