import 'package:dio/dio.dart';

abstract class IUserApi {
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
}
