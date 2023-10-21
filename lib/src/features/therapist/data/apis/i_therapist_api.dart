import 'package:dio/dio.dart';

abstract class ITherapistApi {
  Future<Response> getUserDetails({
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
}
