import 'package:dio/dio.dart';

abstract class IExecutiveDashboardApi {
  Future<Response> getAllotedSlotAllTherapist(
      {required date, CancelToken? cancelToken});
  Future<Response> getCompletedSlotAllTherapist({
    required date,
    CancelToken? cancelToken,
  });
}
