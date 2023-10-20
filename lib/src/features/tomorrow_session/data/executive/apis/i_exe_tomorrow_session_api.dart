import 'package:dio/dio.dart';

abstract class IExeTomorrowSessionApi {
  Future<Response> getTomorrowSession({
    required date,
    CancelToken? cancelToken,
  });
}
