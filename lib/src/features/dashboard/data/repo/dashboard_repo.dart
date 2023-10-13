import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/core/exception/app_exception.dart';
import 'package:theraman/src/features/dashboard/data/apis/i_dashboard_api.dart';
import 'package:theraman/src/features/dashboard/model/alloted_slot_response.dart';
import 'package:theraman/src/features/dashboard/model/completed_session_model.dart';
import 'i_dashboard_repo.dart';

class DashboardRepo extends IDashboardRepo {
  final IDashboardApi iDashboardApi;
  DashboardRepo({required this.iDashboardApi});

  @override
  Future<Result<AllotedSlotResponse, AppException>> getAllotedSlotDetails({
    required String userId,
    required String date,
    CancelToken? cancelToken,
  }) async {
    final response = await iDashboardApi.getAllotedSlotDetails(
        userId: userId, date: date, cancelToken: cancelToken);

    if (response.statusCode == 200) {
      try {
        return Success(AllotedSlotResponse.fromJson(response.data));
      } catch (e) {
        return Error(AppException(response.data.toString()));
      }
    } else if (response.statusCode == 405) {
      return Error(MethodNotAllowedException(
          "${response.statusCode} ${response.data["Message"]} !"));
    } else if (response.statusCode == 404) {
      return Error(NotFoundException("${response.statusCode} Not Found !"));
    } else if (response.statusCode == 500) {
      return Error(
          ServerException("${response.statusCode} internal server error !"));
    } else {
      return Error(NotFoundException("Not Found !"));
    }
  }

  @override
  Future<Result<CompletedSessionModel, AppException>> getCompletedSession({
    required String userId,
    required String date,
    CancelToken? cancelToken,
  }) async {
    final response = await iDashboardApi.getCompletedSession(
        userId: userId, date: date, cancelToken: cancelToken);

    if (response.statusCode == 200) {
      try {
        return Success(CompletedSessionModel.fromJson(response.data));
      } catch (e) {
        return Error(AppException(response.data.toString()));
      }
    } else if (response.statusCode == 405) {
      return Error(MethodNotAllowedException(
          "${response.statusCode} ${response.data["Message"]} !"));
    } else if (response.statusCode == 404) {
      return Error(NotFoundException("${response.statusCode} Not Found !"));
    } else if (response.statusCode == 500) {
      return Error(
          ServerException("${response.statusCode} internal server error !"));
    } else {
      return Error(NotFoundException("Not Found !"));
    }
  }

  @override
  Future<Result<String, AppException>> startSession(
      {required String userId,
      required String userType,
      CancelToken? cancelToken}) async {
    final response = await iDashboardApi.startSession(
        userId: userId, userType: userType, cancelToken: cancelToken);

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
      return Error(NotFoundException("${response.statusCode} Not Found !"));
    } else if (response.statusCode == 500) {
      return Error(
          ServerException("${response.statusCode} internal server error !"));
    } else {
      return Error(NotFoundException("Not Found !"));
    }
  }

  @override
  Future<Result<String, AppException>> completeSession(
      {required String userId,
      required String userType,
      CancelToken? cancelToken}) async {
    final response = await iDashboardApi.completeSession(
        userId: userId, userType: userType, cancelToken: cancelToken);

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
      return Error(NotFoundException("${response.statusCode} Not Found !"));
    } else if (response.statusCode == 500) {
      return Error(
          ServerException("${response.statusCode} internal server error !"));
    } else {
      return Error(NotFoundException("Not Found !"));
    }
  }
}
