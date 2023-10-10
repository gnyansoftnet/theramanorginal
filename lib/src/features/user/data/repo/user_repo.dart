import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/features/authentication/model/user_model.dart';
import 'package:theraman/src/features/user/data/apis/i_user_api.dart';
import 'package:theraman/src/features/user/data/repo/i_user_repo.dart';

class UserRepo extends IUserRepo {
  final IUserApi iUserApi;
  UserRepo({required this.iUserApi});

  @override
  Future<Result<UserModel, Exception>> getuserDetails(
      {required String userId,
      required String userType,
      CancelToken? cancelToken}) async {
    final response = await iUserApi.getUserDetails(
        userType: userType, userId: userId, cancelToken: cancelToken);

    if (response.statusCode == 200) {
      try {
        return Success(UserModel.fromJson(response.data));
      } catch (e) {
        return Error(Exception());
      }
    } else {
      return Error(Exception());
    }
  }

  @override
  Future<Result<String, Exception>> userApplyLeave(
      {required String userId,
      required double noOfDays,
      required String fromDate,
      required String toDate,
      required String leaveType,
      required String reason,
      CancelToken? cancelToken}) async {
    final response = await iUserApi.userApplyLeave(
        userId: userId,
        noOfDays: noOfDays,
        fromDate: fromDate,
        toDate: toDate,
        leaveType: leaveType,
        reason: reason);

    if (response.statusCode == 200) {
      try {
        return const Success("Apply Sucessfully");
      } catch (e) {
        return Error(Exception());
      }
    } else {
      return Error(Exception());
    }
  }
}
