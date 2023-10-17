import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/core/exception/app_exception.dart';
import 'package:theraman/src/global/model/user_model.dart';
import 'package:theraman/src/features/user/model/leave_details_model.dart';

abstract class IUserRepo {
  Future<Result<UserModel, AppException>> getuserDetails({
    required String userId,
    required String userType,
    CancelToken? cancelToken,
  });
  Future<Result<String, AppException>> userApplyLeave({
    required String userId,
    required double noOfDays,
    required String fromDate,
    required String toDate,
    required String leaveType,
    required String reason,
    CancelToken? cancelToken,
  });

  Future<Result<LeaveDetailsModel, AppException>> getleaveStatus({
    required String userId,
    required String? fromDate,
    required String? toDate,
    CancelToken? cancelToken,
  });
}
