import 'package:dio/dio.dart';

abstract class IExecutiveDashboardApi {
  Future<Response> getCompletedSlotAllTherapist({
    required date,
    CancelToken? cancelToken,
  });
}
