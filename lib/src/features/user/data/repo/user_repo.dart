import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/core/exception/app_exception.dart';
import 'package:theraman/src/global/model/user_model.dart';
import 'package:theraman/src/features/user/data/apis/i_user_api.dart';
import 'package:theraman/src/features/user/data/repo/i_user_repo.dart';
import 'package:theraman/src/features/user/model/leave_details_model.dart';

class UserRepo extends IUserRepo {
  final IUserApi iUserApi;
  UserRepo({required this.iUserApi});

  @override
  Future<Result<UserModel, AppException>> getuserDetails(
      {required String userId,
      required String userType,
      CancelToken? cancelToken}) async {
    final response = await iUserApi.getUserDetails(
        userType: userType, userId: userId, cancelToken: cancelToken);

    if (response.statusCode == 200) {
      try {
        return Success(UserModel.fromJson(response.data));
      } catch (e) {
        return Error(AppException(response.data.toString()));
      }
    } else if (response.statusCode == 405) {
      return Error(MethodNotAllowedException(
          "${response.statusCode} ${response.data["Message"]} !"));
    } else if (response.statusCode == 404) {
      return Error(
          NotFoundException("${response.statusCode} user not found !"));
    } else if (response.statusCode == 500) {
      return Error(
          ServerException("${response.statusCode} internal server error !"));
    } else {
      return Error(NotFoundException("user Not Found is wrong !"));
    }
  }

  @override
  Future<Result<String, AppException>> userApplyLeave(
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
        reason: reason,
        cancelToken: cancelToken);

    if (response.statusCode == 200) {
      try {
        return Success(response.data.toString());
      } catch (e) {
        return Error(AppException(response.data.toString()));
      }
    } else if (response.statusCode == 405) {
      return Error(MethodNotAllowedException(
          "${response.statusCode} ${response.data["Message"]} !"));
    } else if (response.statusCode == 404) {
      return Error(
          NotFoundException("${response.statusCode} something is wrong !"));
    } else if (response.statusCode == 500) {
      return Error(
          ServerException("${response.statusCode} internal server error !"));
    } else {
      return Error(NotFoundException("Something  is wrong !"));
    }
  }

  @override
  Future<Result<LeaveDetailsModel, AppException>> getleaveStatus(
      {required String userId,
      required String? fromDate,
      required String? toDate,
      CancelToken? cancelToken}) async {
    final response = await iUserApi.getleaveStatus(
        userId: userId,
        fromDate: fromDate,
        toDate: toDate,
        cancelToken: cancelToken);

    if (response.statusCode == 200) {
      try {
        return Success(LeaveDetailsModel.fromJson(response.data));
      } catch (e) {
        return Error(AppException(response.data.toString()));
      }
    } else if (response.statusCode == 405) {
      return Error(MethodNotAllowedException(
          "${response.statusCode} ${response.data["Message"]} !"));
    } else if (response.statusCode == 404) {
      return Error(NotFoundException("${response.statusCode} Not found !"));
    } else if (response.statusCode == 500) {
      return Error(
          ServerException("${response.statusCode} internal server error !"));
    } else {
      return Error(NotFoundException("not found !"));
    }
  }
}
