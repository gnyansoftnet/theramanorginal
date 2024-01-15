import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/features/executive/model/reason_model.dart';
import 'package:theraman/src/features/executive/model/slot_time_model.dart';
import 'package:theraman/src/features/executive/model/therapist_name_model.dart';
import 'package:theraman/src/global/exception/api_exception.dart';
import 'package:theraman/src/features/therapist/model/leave_details_model.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';

abstract class IExecutiveRepo {
  Future<Result<AllotedSlotResponseModel, APIException>>
      getCompletedSlotAllTherapist(
          {required String date, CancelToken? cancelToken});

  Future<Result<AllotedSlotResponseModel, APIException>>
      getAllotedSlotAllTherapist(
          {required String date, CancelToken? cancelToken});

  Future<Result<ReasonModel, APIException>> getReason(
      {CancelToken? cancelToken});

  Future<Result<String, APIException>> cancelSession(
      {required String userId,
      required String userType,
      required int slotId,
      required String isAdjustable,
      required String reason,
      CancelToken? cancelToken});

  Future<Result<AllotedSlotResponseModel, APIException>>
      getCancelledSessionAllTherapist(
          {required String date, CancelToken? cancelToken});

  Future<Result<TherapistNameModel, APIException>> getTherapistName(
      {CancelToken? cancelToken});

  Future<Result<SlotTimeModel, APIException>> getSlotTime(
      {CancelToken? cancelToken});

  Future<Result<String, APIException>> changeTherapist(
      {required String userType,
      required String userId,
      required int slotId,
      required String reason,
      required String therapistName,
      CancelToken? cancelToken});

  Future<Result<String, APIException>> sessionReschedule(
      {required String userType,
      required String userId,
      required int slotId,
      required String reason,
      required String therapistName,
      required String slotTime,
      CancelToken? cancelToken});

  Future<Result<String, APIException>> exeStartSession({
    required String userType,
    required String userId,
    required int slotId,
    CancelToken? cancelToken,
  });

  Future<Result<String, APIException>> exeCompleteSession({
    required String userType,
    required String userId,
    required int slotId,
    CancelToken? cancelToken,
  });

  Future<Result<String, APIException>> resumeCancelledSession({
    required String userType,
    required String userId,
    required int slotId,
    CancelToken? cancelToken,
  });

  Future<Result<AllotedSlotResponseModel, APIException>> getTomorrowSession({
    required String date,
    CancelToken? cancelToken,
  });

  Future<Result<LeaveDetailsModel, APIException>> getAllTherapistLeaveDetail(
      {required fromDate, required toDate, CancelToken? cancelToken});

  Future<Result<String, APIException>> exeApplyLeave({
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
