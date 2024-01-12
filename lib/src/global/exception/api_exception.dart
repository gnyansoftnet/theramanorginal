import 'dart:convert';

class APIException implements Exception {
  final int? statusCode;
  final String? errorMessage;
  final String? statusMessage;

  APIException({
    this.statusCode = 000,
    this.errorMessage = "api error",
    this.statusMessage = "err",
  });

  APIException copyWith({
    int? statusCode,
    String? errorMessage,
    String? statusMessage,
  }) {
    return APIException(
      statusCode: statusCode ?? this.statusCode,
      errorMessage: errorMessage ?? this.errorMessage,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'statusCode': statusCode,
      'errorMessage': errorMessage,
      'statusMessage': statusMessage,
    };
  }

  factory APIException.fromMap(Map<String, dynamic> map) {
    return APIException(
      statusCode: map['statusCode']?.toInt(),
      errorMessage: map['errorMessage'],
      statusMessage: map['statusMessage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory APIException.fromJson(String source) =>
      APIException.fromMap(json.decode(source));

  @override
  String toString() =>
      'statusCode: $statusCode, errorMessage: $errorMessage, statusMessage: $statusMessage';
  // @override
  // String toString() => "$errorMessage";

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is APIException &&
        other.statusCode == statusCode &&
        other.errorMessage == errorMessage &&
        other.statusMessage == statusMessage;
  }

  @override
  int get hashCode =>
      statusCode.hashCode ^ errorMessage.hashCode ^ statusMessage.hashCode;
}
