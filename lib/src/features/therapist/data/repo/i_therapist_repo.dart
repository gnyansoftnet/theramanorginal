import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/global/exception/api_exception.dart';
import 'package:theraman/src/features/therapist/model/session_summary_detail_model.dart';
import 'package:theraman/src/features/therapist/model/session_summery_model.dart';
import 'package:theraman/src/features/therapist/model/leave_details_model.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';

abstract class ITherapistRepo {
  Future<Result<AllotedSlotResponseModel, APIException>> getAllotedSlotDetails({
    required String userId,
    required String date,
    CancelToken? cancelToken,
  });
  Future<Result<AllotedSlotResponseModel, APIException>> getCompletedSession({
    required String userId,
    required String date,
    CancelToken? cancelToken,
  });

  Future<Result<String, APIException>> startSession({
    required String userId,
    required int slotId,
    required String userType,
    CancelToken? cancelToken,
  });
  Future<Result<String, APIException>> completeSession({
    required int slotId,
    required String userId,
    required String userType,
    CancelToken? cancelToken,
  });
  Future<Result<String, APIException>> userApplyLeave({
    required String userId,
    required double noOfDays,
    required String fromDate,
    required String toDate,
    required String leaveType,
    required String reason,
    CancelToken? cancelToken,
  });

  Future<Result<LeaveDetailsModel, APIException>> getleaveStatus({
    required String userId,
    required String? fromDate,
    required String? toDate,
    CancelToken? cancelToken,
  });
  Future<Result<SessionSummaryModel, APIException>> getSessionSummary({
    required String userId,
    required String month,
    CancelToken? cancelToken,
  });
  Future<Result<SessionSummaryDetailModel, APIException>>
      getSessionSummaryDetails({
    required String userId,
    required String month,
    CancelToken? cancelToken,
  });
}
