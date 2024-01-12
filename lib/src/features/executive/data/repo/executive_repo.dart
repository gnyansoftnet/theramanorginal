import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/global/exception/app_exception.dart';
import 'package:theraman/src/features/executive/data/apis/i_executive_api.dart';
import 'package:theraman/src/features/executive/data/repo/i_executive_repo.dart';
import 'package:theraman/src/features/therapist/model/leave_details_model.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';

class ExecutiveRepo extends IExecutiveRepo {
  final IExecutiveApi iExecutiveApi;
  ExecutiveRepo({required this.iExecutiveApi});

  @override
  Future<Result<AllotedSlotResponseModel, AppException>> getTomorrowSession(
      {required String date, CancelToken? cancelToken}) async {
    final response = await iExecutiveApi.getTomorrowSession(date: date);
    if (response.statusCode == 200) {
      try {
        return Success(AllotedSlotResponseModel.fromJson(response.data));
      } catch (e) {
        return Error(AppException(response.data.toString()));
      }
    } else if (response.statusCode == 404) {
      return Error(NotFoundException("${response.statusCode} Not Found !"));
    } else if (response.statusCode == 500) {
      return Error(
          ServerException("${response.statusCode} Server Internal Error"));
    } else if (response.statusCode == 405) {
      return Error(MethodNotAllowedException(
          "${response.statusCode} Method not Allowed"));
    } else {
      return Error(AppException("Some thing is wrong"));
    }
  }

  @override
  Future<Result<LeaveDetailsModel, AppException>> getAllTherapistLeaveDetail(
      {required fromDate, required toDate, CancelToken? cancelToken}) async {
    final response = await iExecutiveApi.getAllTherapistLeaveDetail(
        fromDate: fromDate, toDate: toDate, cancelToken: cancelToken);
    if (response.statusCode == 200) {
      try {
        return Success(LeaveDetailsModel.fromJson(response.data));
      } catch (e) {
        return Error(AppException(response.data.toString()));
      }
    } else if (response.statusCode == 404) {
      return Error(NotFoundException("${response.statusCode} Not Found !"));
    } else if (response.statusCode == 500) {
      return Error(
          ServerException("${response.statusCode} Server Internal Error"));
    } else if (response.statusCode == 405) {
      return Error(MethodNotAllowedException(
          "${response.statusCode} Method not Allowed"));
    } else {
      return Error(AppException("Some thing is wrong"));
    }
  }

  @override
  Future<Result<String, AppException>> exeApplyLeave(
      {required String userType,
      required String userId,
      required double noOfDays,
      required String fromDate,
      required String toDate,
      required String leaveType,
      required String reason,
      CancelToken? cancelToken}) async {
    final response = await iExecutiveApi.exeApplyLeave(
        userType: userType,
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
}
