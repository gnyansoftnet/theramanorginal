import 'package:dio/dio.dart';

abstract class ITherapistApi {
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
  Future<Response> userApplyLeave({
    required userId,
    required noOfDays,
    required fromDate,
    required toDate,
    required leaveType,
    required reason,
    CancelToken? cancelToken,
  });
  Future<Response> getleaveStatus({
    required userId,
    required fromDate,
    required toDate,
    CancelToken? cancelToken,
  });
  Future<Response> getSessionSummary({
    required userId,
    required month,
    CancelToken? cancelToken,
  });
  Future<Response> getSessionSummaryDetail({
    required userId,
    required month,
    CancelToken? cancelToken,
  });
}
