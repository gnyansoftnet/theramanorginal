import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/features/executive/model/reason_model.dart';
import 'package:theraman/src/features/executive/model/slot_time_model.dart';
import 'package:theraman/src/features/executive/model/therapist_name_model.dart';
import 'package:theraman/src/global/exception/app_exception.dart';
import 'package:theraman/src/features/therapist/model/leave_details_model.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';

abstract class IExecutiveRepo {
  Future<Result<AllotedSlotResponseModel, AppException>>
      getCompletedSlotAllTherapist(
          {required String date, CancelToken? cancelToken});

  Future<Result<AllotedSlotResponseModel, AppException>>
      getAllotedSlotAllTherapist(
          {required String date, CancelToken? cancelToken});

  Future<Result<ReasonModel, AppException>> getReason(
      {CancelToken? cancelToken});

  Future<Result<String, AppException>> cancelSession(
      {required String userId,
      required String userType,
      required int slotId,
      required String isAdjustable,
      required String reason,
      CancelToken? cancelToken});
  Future<Result<AllotedSlotResponseModel, AppException>>
      getCancelledSessionAllTherapist(
          {required String date, CancelToken? cancelToken});

  Future<Result<TherapistNameModel, AppException>> getTherapistName(
      {CancelToken? cancelToken});

  Future<Result<SlotTimeModel, AppException>> getSlotTime(
      {CancelToken? cancelToken});

  Future<Result<String, AppException>> changeTherapist(
      {required String userType,
      required String userId,
      required int slotId,
      required String reason,
      required String therapistName,
      CancelToken? cancelToken});

  Future<Result<String, AppException>> sessionReschedule(
      {required String userType,
      required String userId,
      required int slotId,
      required String reason,
      required String therapistName,
      required String slotTime,
      CancelToken? cancelToken});
  Future<Result<String, AppException>> exeStartSession({
    required String userType,
    required String userId,
    required int slotId,
    CancelToken? cancelToken,
  });
  Future<Result<String, AppException>> exeCompleteSession({
    required String userType,
    required String userId,
    required int slotId,
    CancelToken? cancelToken,
  });
  Future<Result<String, AppException>> resumeCancelledSession({
    required String userType,
    required String userId,
    required int slotId,
    CancelToken? cancelToken,
  });
  Future<Result<AllotedSlotResponseModel, AppException>> getTomorrowSession({
    required String date,
    CancelToken? cancelToken,
  });
  Future<Result<LeaveDetailsModel, AppException>> getAllTherapistLeaveDetail(
      {required fromDate, required toDate, CancelToken? cancelToken});
  Future<Result<String, AppException>> exeApplyLeave({
    required String userType,
    required String userId,
    required double noOfDays,
    required String fromDate,
    required String toDate,
    required String leaveType,
    required String reason,
    CancelToken? cancelToken,
  });
}
