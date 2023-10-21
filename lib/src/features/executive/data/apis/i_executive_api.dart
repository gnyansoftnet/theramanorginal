import 'package:dio/dio.dart';

abstract class IExecutiveApi {
  Future<Response> getTomorrowSession({
    required date,
    CancelToken? cancelToken,
  });
  Future<Response> getAllTherapistLeaveDetail(
      {required fromDate, required toDate, CancelToken? cancelToken});
}
