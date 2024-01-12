import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/global/exception/api_exception.dart';

typedef Mapper<T> = T Function(dynamic data);

extension ResponseHandler on Response {
  Result<T, APIException> successErrorHandler<T>({
    required Mapper<T> successMapper,
    Mapper<APIException>? errorMapper,
    List<int> defaultSuccessCode = const [200, 201, 202, 203, 204, 205, 206],
  }) {
    if (defaultSuccessCode.contains(statusCode)) {
      if (kDebugMode) {
        T successData = successMapper(data);
        return Result<T, APIException>.success(successData);
      } else {
        try {
          T successData = successMapper(data);
          return Result<T, APIException>.success(successData);
        } catch (e) {
          APIException errorData = errorMapper?.call(data) ??
              APIException(
                statusCode: statusCode,
                errorMessage: 'Error parsing response data $e',
              );
          return Result<T, APIException>.error(errorData);
        }
      }
    } else {
      APIException errorData = errorMapper?.call(data) ??
          APIException.fromMap(data).copyWith(
            statusCode: statusCode,
            statusMessage: statusMessage,
            errorMessage: "${data["Message"]}",
          );
      return Result<T, APIException>.error(errorData);
    }
  }
}
