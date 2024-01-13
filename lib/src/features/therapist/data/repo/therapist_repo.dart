import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/global/exception/app_exception.dart';
import 'package:theraman/src/features/therapist/model/session_summary_detail_model.dart';
import 'package:theraman/src/features/therapist/model/session_summery_model.dart';
import 'package:theraman/src/features/therapist/data/apis/i_therapist_api.dart';
import 'package:theraman/src/features/therapist/data/repo/i_therapist_repo.dart';
import 'package:theraman/src/features/therapist/model/leave_details_model.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';

class TherapistRepo extends ITherapistRepo {
  final ITherapistApi iTherapistApi;
  TherapistRepo({required this.iTherapistApi});

  @override
  Future<Result<AllotedSlotResponseModel, AppException>> getAllotedSlotDetails({
    required String userId,
    required String date,
    CancelToken? cancelToken,
  }) async {
    final response = await iTherapistApi.getAllotedSlotDetails(
        userId: userId, date: date, cancelToken: cancelToken);

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
      return Error(NotFoundException("Not Found !"));
    }
  }

  @override
  Future<Result<AllotedSlotResponseModel, AppException>> getCompletedSession({
    required String userId,
    required String date,
    CancelToken? cancelToken,
  }) async {
    final response = await iTherapistApi.getCompletedSession(
        userId: userId, date: date, cancelToken: cancelToken);

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
      return Error(NotFoundException("Not Found !"));
    }
  }

  @override
  Future<Result<String, AppException>> startSession(
      {required String userId,
      required int slotId,
      required String userType,
      CancelToken? cancelToken}) async {
    final response = await iTherapistApi.startSession(
        userId: userId,
        slotId: slotId,
        userType: userType,
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
      required int slotId,
      CancelToken? cancelToken}) async {
    final response = await iTherapistApi.completeSession(
        userId: userId,
        slotId: slotId,
        userType: userType,
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
      return Error(NotFoundException("${response.statusCode} Not Found !"));
    } else if (response.statusCode == 500) {
      return Error(
          ServerException("${response.statusCode} internal server error !"));
    } else {
      return Error(NotFoundException("Not Found !"));
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
    final response = await iTherapistApi.userApplyLeave(
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
    final response = await iTherapistApi.getleaveStatus(
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

  @override
  Future<Result<SessionSummaryModel, AppException>> getSessionSummary(
      {required String userId,
      required String month,
      CancelToken? cancelToken}) async {
    final response =
        await iTherapistApi.getSessionSummary(userId: userId, month: month);
    if (response.statusCode == 200) {
      try {
        return Success(SessionSummaryModel.fromJson(response.data));
      } catch (e) {
        return Error(ServerException(response.data.toString()));
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

  @override
  Future<Result<SessionSummaryDetailModel, AppException>>
      getSessionSummaryDetails(
          {required String userId,
          required String month,
          CancelToken? cancelToken}) async {
    final response = await iTherapistApi.getSessionSummaryDetail(
        userId: userId, month: month);
    if (response.statusCode == 200) {
      try {
        return Success(SessionSummaryDetailModel.fromJson(response.data));
      } catch (e) {
        return Error(ServerException(response.data.toString()));
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
