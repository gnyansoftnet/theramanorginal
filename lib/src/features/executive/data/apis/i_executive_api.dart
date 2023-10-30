import 'package:dio/dio.dart';

abstract class IExecutiveApi {
  Future<Response> getTomorrowSession({
    required date,
    CancelToken? cancelToken,
  });
  Future<Response> getAllTherapistLeaveDetail(
      {required fromDate, required toDate, CancelToken? cancelToken});

  Future<Response> exeApplyLeave({
    required userId,
    required noOfDays,
    required fromDate,
    required toDate,
    required leaveType,
    required reason,
    CancelToken? cancelToken,
  });
}
