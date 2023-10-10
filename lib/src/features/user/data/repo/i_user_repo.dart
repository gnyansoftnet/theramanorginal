import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/features/authentication/model/user_model.dart';

abstract class IUserRepo {
  Future<Result<UserModel, Exception>> getuserDetails({
    required String userId,
    required String userType,
    CancelToken? cancelToken,
  });
  Future<Result<String, Exception>> userApplyLeave({
    required String userId,
    required double noOfDays,
    required String fromDate,
    required String toDate,
    required String leaveType,
    required String reason,
    CancelToken? cancelToken,
  });
}
