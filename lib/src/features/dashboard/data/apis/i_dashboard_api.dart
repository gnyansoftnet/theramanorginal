import 'package:dio/dio.dart';

abstract class IDashboardApi {
  Future<Response> getAllotedSlotDetails({
    required userId,
    CancelToken? cancelToken,
  });
}
