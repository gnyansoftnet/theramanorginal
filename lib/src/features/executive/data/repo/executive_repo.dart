import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/features/executive/model/reason_model.dart';
import 'package:theraman/src/features/executive/model/slot_time_model.dart';
import 'package:theraman/src/features/executive/model/therapist_name_model.dart';
import 'package:theraman/src/global/exception/api_exception.dart';
import 'package:theraman/src/features/executive/data/apis/i_executive_api.dart';
import 'package:theraman/src/features/executive/data/repo/i_executive_repo.dart';
import 'package:theraman/src/features/therapist/model/leave_details_model.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/utils/extensions/ext.dart';

class ExecutiveRepo extends IExecutiveRepo {
  final IExecutiveApi iExecutiveApi;
  ExecutiveRepo({required this.iExecutiveApi});

  @override
  Future<Result<AllotedSlotResponseModel, APIException>>
      getCompletedSlotAllTherapist(
          {required String date, CancelToken? cancelToken}) async {
    final response = await iExecutiveApi.getCompletedSlotAllTherapist(
        date: date, cancelToken: cancelToken);
    return response.successErrorHandler(
        successMapper: (result) => AllotedSlotResponseModel.fromJson(result));
  }

  @override
  Future<Result<AllotedSlotResponseModel, APIException>>
      getAllotedSlotAllTherapist(
          {required String date, CancelToken? cancelToken}) async {
    final response = await iExecutiveApi.getAllotedSlotAllTherapist(
        date: date, cancelToken: cancelToken);
    return response.successErrorHandler(
        successMapper: (result) => AllotedSlotResponseModel.fromJson(result));
  }

  @override
  Future<Result<ReasonModel, APIException>> getReason(
      {CancelToken? cancelToken}) async {
    final response = await iExecutiveApi.getReason(cancelToken: cancelToken);
    return response.successErrorHandler(
        successMapper: (result) => ReasonModel.fromJson(result));
  }

  @override
  Future<Result<String, APIException>> cancelSession(
      {required String userId,
      required String userType,
      required int slotId,
      required String isAdjustable,
      required String reason,
      CancelToken? cancelToken}) async {
    final response = await iExecutiveApi.cancelSession(
        userId: userId,
        userType: userType,
        slotId: slotId,
        isAdjustable: isAdjustable,
        reason: reason);
    return response.successErrorHandler(successMapper: (result) => result);
  }

  @override
  Future<Result<AllotedSlotResponseModel, APIException>>
      getCancelledSessionAllTherapist(
          {required String date, CancelToken? cancelToken}) async {
    final response =
        await iExecutiveApi.getCancelledSessionAllTherapist(date: date);
    return response.successErrorHandler(
        successMapper: (result) => AllotedSlotResponseModel.fromJson(result));
  }

  @override
  Future<Result<TherapistNameModel, APIException>> getTherapistName(
      {CancelToken? cancelToken}) async {
    final response = await iExecutiveApi.getTherapistName();
    return response.successErrorHandler(
        successMapper: (result) => TherapistNameModel.fromJson(result));
  }

  @override
  Future<Result<SlotTimeModel, APIException>> getSlotTime(
      {CancelToken? cancelToken}) async {
    final response = await iExecutiveApi.getSlotTime(cancelToken: cancelToken);
    return response.successErrorHandler(
        successMapper: (result) => SlotTimeModel.fromJson(result));
  }

  @override
  Future<Result<String, APIException>> changeTherapist(
      {required String userType,
      required String userId,
      required int slotId,
      required String reason,
      required String therapistName,
      CancelToken? cancelToken}) async {
    final response = await iExecutiveApi.changeTherapist(
        userType: userType,
        userId: userId,
        slotId: slotId,
        therapistName: therapistName,
        reason: reason,
        cancelToken: cancelToken);
    return response.successErrorHandler(successMapper: (result) => result);
  }

  @override
  Future<Result<String, APIException>> sessionReschedule({
    required String userType,
    required String userId,
    required int slotId,
    required String reason,
    required String therapistName,
    required String slotTime,
    CancelToken? cancelToken,
  }) async {
    final response = await iExecutiveApi.sessionReschedule(
        userType: userType,
        userId: userId,
        slotId: slotId,
        therapistName: therapistName,
        reason: reason,
        slotTime: slotTime,
        cancelToken: cancelToken);
    return response.successErrorHandler(successMapper: (result) => result);
  }

  @override
  Future<Result<String, APIException>> exeCompleteSession(
      {required String userType,
      required String userId,
      required int slotId,
      CancelToken? cancelToken}) async {
    final response = await iExecutiveApi.exeCompleteSession(
        userType: userType, userId: userId, slotId: slotId);
    return response.successErrorHandler(successMapper: (result) => result);
  }

  @override
  Future<Result<String, APIException>> exeStartSession(
      {required String userType,
      required String userId,
      required int slotId,
      CancelToken? cancelToken}) async {
    final response = await iExecutiveApi.exeStartSession(
        userType: userType, userId: userId, slotId: slotId);
    return response.successErrorHandler(successMapper: (result) => result);
  }

  @override
  Future<Result<String, APIException>> resumeCancelledSession(
      {required String userType,
      required String userId,
      required int slotId,
      CancelToken? cancelToken}) async {
    final response = await iExecutiveApi.resumeCancelledSession(
        userType: userType, userId: userId, slotId: slotId);
    return response.successErrorHandler(successMapper: (result) => result);
  }

  @override
  Future<Result<AllotedSlotResponseModel, APIException>> getTomorrowSession(
      {required String date, CancelToken? cancelToken}) async {
    final response = await iExecutiveApi.getTomorrowSession(date: date);
    return response.successErrorHandler(
        successMapper: (result) => AllotedSlotResponseModel.fromJson(result));
  }

  @override
  Future<Result<LeaveDetailsModel, APIException>> getAllTherapistLeaveDetail(
      {required fromDate, required toDate, CancelToken? cancelToken}) async {
    final response = await iExecutiveApi.getAllTherapistLeaveDetail(
        fromDate: fromDate, toDate: toDate, cancelToken: cancelToken);
    return response.successErrorHandler(
        successMapper: (result) => LeaveDetailsModel.fromJson(result));
  }

  @override
  Future<Result<String, APIException>> exeApplyLeave(
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
    return response.successErrorHandler(successMapper: (result) => result);
  }
}
