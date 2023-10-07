import 'package:dio/dio.dart';

abstract class IDashboardApi {
  Future<Response> getAllotedSlotDetails({
    required userId,
    CancelToken? cancelToken,
  });
  Future<Response> startSession({
    required userId,
    required userType,
    CancelToken? cancelToken,
  });
  Future<Response> completeSession({
    required userId,
    required userType,
    CancelToken? cancelToken,
  });
}
