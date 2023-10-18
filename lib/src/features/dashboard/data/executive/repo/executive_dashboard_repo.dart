import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/core/exception/app_exception.dart';
import 'package:theraman/src/features/dashboard/data/executive/apis/i_executive_dashboard_api.dart';
import 'package:theraman/src/features/dashboard/data/executive/repo/i_executive_dashboard_repo.dart';
import 'package:theraman/src/features/dashboard/model/executive/reason_model.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';

class ExecutiveDashboardRepo extends IExecutiveDashboardRepo {
  final IExecutiveDashboardApi iExecutiveDashboardApi;
  ExecutiveDashboardRepo({required this.iExecutiveDashboardApi});
  @override
  Future<Result<AllotedSlotResponseModel, AppException>>
      getCompletedSlotAllTherapist(
          {required String date, CancelToken? cancelToken}) async {
    final response = await iExecutiveDashboardApi.getCompletedSlotAllTherapist(
        date: date, cancelToken: cancelToken);
    if (response.statusCode == 200) {
      try {
        return Success(AllotedSlotResponseModel.fromJson(response.data));
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
      return Error(
          AppException("${response.statusCode} Internal Server errror !"));
    }
  }

  @override
  Future<Result<AllotedSlotResponseModel, AppException>>
      getAllotedSlotAllTherapist(
          {required String date, CancelToken? cancelToken}) async {
    final response = await iExecutiveDashboardApi.getAllotedSlotAllTherapist(
        date: date, cancelToken: cancelToken);
    if (response.statusCode == 200) {
      try {
        return Success(AllotedSlotResponseModel.fromJson(response.data));
      } catch (e) {
        return Error(AppException(response.data.toString()));
      }
    } else if (response.statusCode == 404) {
      return Error(NotFoundException("${response.statusCode}Not Found !"));
    } else if (response.statusCode == 405) {
      return Error(MethodNotAllowedException(
          "${response.statusCode} ${response.data["Message"]} !"));
    } else if (response.statusCode == 500) {
      return Error(
          ServerException("${response.statusCode} internal server error !"));
    } else {
      return Error(
          AppException("${response.statusCode} Internal Server errror !"));
    }
  }

  @override
  Future<Result<ReasonModel, AppException>> getReason(
      {CancelToken? cancelToken}) async {
    final response =
        await iExecutiveDashboardApi.getReason(cancelToken: cancelToken);
    if (response.statusCode == 200) {
      try {
        return Success(ReasonModel.fromJson(response.data));
      } catch (e) {
        return Error(AppException(response.data.toString()));
      }
    } else if (response.statusCode == 404) {
      return Error(NotFoundException("${response.statusCode}Not Found !"));
    } else if (response.statusCode == 405) {
      return Error(MethodNotAllowedException(
          "${response.statusCode} ${response.data["Message"]} !"));
    } else if (response.statusCode == 500) {
      return Error(
          ServerException("${response.statusCode} internal server error !"));
    } else {
      return Error(
          AppException("${response.statusCode} Internal Server errror !"));
    }
  }

  @override
  Future<Result<String, AppException>> cancelSession(
      {required String userId,
      required String userType,
      required int slotId,
      required String isAdjustable,
      required String reason,
      CancelToken? cancelToken}) async {
    final response = await iExecutiveDashboardApi.cancelSession(
        userId: userId,
        userType: userType,
        slotId: slotId,
        isAdjustable: isAdjustable,
        reason: reason);
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
      return Error(ServerException(
          "${response.statusCode} ${response.data["Message"]} !"));
    } else {
      return Error(
          AppException("${response.statusCode} Internal Server errror !"));
    }
  }

  @override
  Future<Result<AllotedSlotResponseModel, AppException>>
      getCancelledSessionAllTherapist(
          {required String date, CancelToken? cancelToken}) async {
    final response = await iExecutiveDashboardApi
        .getCancelledSessionAllTherapist(date: date);
    if (response.statusCode == 200) {
      try {
        return Success(AllotedSlotResponseModel.fromJson(response.data));
      } catch (e) {
        return Error(AppException(response.data.toString()));
      }
    } else if (response.statusCode == 405) {
      return Error(MethodNotAllowedException(
          "${response.statusCode} ${response.data["Message"]} !"));
    } else if (response.statusCode == 404) {
      return Error(NotFoundException("${response.statusCode} Not Found !"));
    } else if (response.statusCode == 500) {
      return Error(ServerException(
          "${response.statusCode} ${response.data["Message"]} !"));
    } else {
      return Error(
          AppException("${response.statusCode} Internal Server errror !"));
    }
  }
}
