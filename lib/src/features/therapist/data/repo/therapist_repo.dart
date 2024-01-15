import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/global/exception/api_exception.dart';
import 'package:theraman/src/features/therapist/model/session_summary_detail_model.dart';
import 'package:theraman/src/features/therapist/model/session_summery_model.dart';
import 'package:theraman/src/features/therapist/data/apis/i_therapist_api.dart';
import 'package:theraman/src/features/therapist/data/repo/i_therapist_repo.dart';
import 'package:theraman/src/features/therapist/model/leave_details_model.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/utils/extensions/ext.dart';

class TherapistRepo extends ITherapistRepo {
  final ITherapistApi iTherapistApi;
  TherapistRepo({required this.iTherapistApi});

  @override
  Future<Result<AllotedSlotResponseModel, APIException>> getAllotedSlotDetails({
    required String userId,
    required String date,
    CancelToken? cancelToken,
  }) async {
    final response = await iTherapistApi.getAllotedSlotDetails(
        userId: userId, date: date, cancelToken: cancelToken);
    return response.successErrorHandler(
        successMapper: (result) => AllotedSlotResponseModel.fromJson(result));
  }

  @override
  Future<Result<AllotedSlotResponseModel, APIException>> getCompletedSession({
    required String userId,
    required String date,
    CancelToken? cancelToken,
  }) async {
    final response = await iTherapistApi.getCompletedSession(
        userId: userId, date: date, cancelToken: cancelToken);
    return response.successErrorHandler(
        successMapper: (result) => AllotedSlotResponseModel.fromJson(result));
  }

  @override
  Future<Result<String, APIException>> startSession(
      {required String userId,
      required int slotId,
      required String userType,
      CancelToken? cancelToken}) async {
    final response = await iTherapistApi.startSession(
        userId: userId,
        slotId: slotId,
        userType: userType,
        cancelToken: cancelToken);

    return response.successErrorHandler(successMapper: (result) => result);
  }

  @override
  Future<Result<String, APIException>> completeSession(
      {required String userId,
      required String userType,
      required int slotId,
      CancelToken? cancelToken}) async {
    final response = await iTherapistApi.completeSession(
        userId: userId,
        slotId: slotId,
        userType: userType,
        cancelToken: cancelToken);
    return response.successErrorHandler(successMapper: (result) => result);
  }

  @override
  Future<Result<String, APIException>> userApplyLeave(
      {required String userId,
      required double noOfDays,
      required String fromDate,
      required String toDate,
      required String leaveType,
      required String reason,
      CancelToken? cancelToken}) async {
    final response = await iTherapistApi.userApplyLeave(
        userId: userId,
        noOfDays: noOfDays,
        fromDate: fromDate,
        toDate: toDate,
        leaveType: leaveType,
        reason: reason,
        cancelToken: cancelToken);
    return response.successErrorHandler(successMapper: (result) => result);
  }

  @override
  Future<Result<LeaveDetailsModel, APIException>> getleaveStatus(
      {required String userId,
      required String? fromDate,
      required String? toDate,
      CancelToken? cancelToken}) async {
    final response = await iTherapistApi.getleaveStatus(
        userId: userId,
        fromDate: fromDate,
        toDate: toDate,
        cancelToken: cancelToken);

    return response.successErrorHandler(
        successMapper: (result) => LeaveDetailsModel.fromJson(result));
  }

  @override
  Future<Result<SessionSummaryModel, APIException>> getSessionSummary(
      {required String userId,
      required String month,
      CancelToken? cancelToken}) async {
    final response =
        await iTherapistApi.getSessionSummary(userId: userId, month: month);
    return response.successErrorHandler(
        successMapper: (result) => SessionSummaryModel.fromJson(result));
  }

  @override
  Future<Result<SessionSummaryDetailModel, APIException>>
      getSessionSummaryDetails(
          {required String userId,
          required String month,
          CancelToken? cancelToken}) async {
    final response = await iTherapistApi.getSessionSummaryDetail(
        userId: userId, month: month);
    return response.successErrorHandler(
        successMapper: (result) => SessionSummaryDetailModel.fromJson(result));
  }
}
