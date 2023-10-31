import 'package:dio/dio.dart';

abstract class IDashboardApi {
  Future<Response> getAllotedSlotDetails({
    required userId,
    required date,
    CancelToken? cancelToken,
  });
  Future<Response> getCompletedSession({
    required userId,
    required date,
    CancelToken? cancelToken,
  });

  Future<Response> startSession({
    required userId,
    required userType,
    required slotId,
    CancelToken? cancelToken,
  });
  Future<Response> completeSession({
    required slotId,
    required userId,
    required userType,
    CancelToken? cancelToken,
  });
}
