import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/features/executive/model/reason_model.dart';
import 'package:theraman/src/features/executive/model/slot_time_model.dart';
import 'package:theraman/src/features/executive/model/therapist_name_model.dart';
import 'package:theraman/src/global/exception/app_exception.dart';
import 'package:theraman/src/features/executive/data/apis/i_executive_api.dart';
import 'package:theraman/src/features/executive/data/repo/i_executive_repo.dart';
import 'package:theraman/src/features/therapist/model/leave_details_model.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';

class ExecutiveRepo extends IExecutiveRepo {
  final IExecutiveApi iExecutiveApi;
  ExecutiveRepo({required this.iExecutiveApi});

  @override
  Future<Result<AllotedSlotResponseModel, AppException>>
      getCompletedSlotAllTherapist(
          {required String date, CancelToken? cancelToken}) async {
    final response = await iExecutiveApi.getCompletedSlotAllTherapist(
        date: date, cancelToken: cancelToken);
    if (response.statusCode == 200) {
      try {
        return Success(AllotedSlotResponseModel.fromJson(response.data));
      } catch (e) {
        return Error(ServerException(response.data.toString()));
      }
    } else if (response.statusCode == 405) {
      return Error(MethodNotAllowedException(
          "${response.statusCode} ${response.data["Message"]} !"));
    } else if (response.statusCode == 404) {
      return Error(NotFoundException("${response.statusCode} Not Found !"));
    } else if (response.statusCode == 400) {
      return Error(BadRequestException("${response.statusCode} Bad Request !"));
    } else if (response.statusCode == 408) {
      return Error(
          RequestTimeOutException("${response.statusCode} Request Timeout !"));
    } else if (response.statusCode == 500) {
      return Error(
          ServerException("${response.statusCode} internal server error !"));
    } else {
      return Error(
          ServerException("${response.statusCode} Something went wrong !"));
    }
  }

  @override
  Future<Result<AllotedSlotResponseModel, AppException>>
      getAllotedSlotAllTherapist(
          {required String date, CancelToken? cancelToken}) async {
    final response = await iExecutiveApi.getAllotedSlotAllTherapist(
        date: date, cancelToken: cancelToken);
    if (response.statusCode == 200) {
      try {
        return Success(AllotedSlotResponseModel.fromJson(response.data));
      } catch (e) {
        return Error(ServerException(response.data.toString()));
      }
    } else if (response.statusCode == 404) {
      return Error(NotFoundException("${response.statusCode}Not Found !"));
    } else if (response.statusCode == 405) {
      return Error(MethodNotAllowedException(
          "${response.statusCode} ${response.data["Message"]} !"));
    } else if (response.statusCode == 400) {
      return Error(BadRequestException("${response.statusCode} Bad Request !"));
    } else if (response.statusCode == 408) {
      return Error(
          RequestTimeOutException("${response.statusCode} Request Timeout !"));
    } else if (response.statusCode == 500) {
      return Error(
          ServerException("${response.statusCode} internal server error !"));
    } else {
      return Error(
          ServerException("${response.statusCode} Something went wrong !"));
    }
  }

  @override
  Future<Result<ReasonModel, AppException>> getReason(
      {CancelToken? cancelToken}) async {
    final response = await iExecutiveApi.getReason(cancelToken: cancelToken);
    if (response.statusCode == 200) {
      try {
        return Success(ReasonModel.fromJson(response.data));
      } catch (e) {
        return Error(ServerException(response.data.toString()));
      }
    } else if (response.statusCode == 404) {
      return Error(NotFoundException("${response.statusCode}Not Found !"));
    } else if (response.statusCode == 405) {
      return Error(MethodNotAllowedException(
          "${response.statusCode} ${response.data["Message"]} !"));
    } else if (response.statusCode == 400) {
      return Error(BadRequestException("${response.statusCode} Bad Request !"));
    } else if (response.statusCode == 408) {
      return Error(
          RequestTimeOutException("${response.statusCode} Request Timeout !"));
    } else if (response.statusCode == 500) {
      return Error(
          ServerException("${response.statusCode} internal server error !"));
    } else {
      return Error(
          ServerException("${response.statusCode} Something went wrong !"));
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
    final response = await iExecutiveApi.cancelSession(
        userId: userId,
        userType: userType,
        slotId: slotId,
        isAdjustable: isAdjustable,
        reason: reason);
    if (response.statusCode == 200) {
      try {
        return Success(response.data.toString());
      } catch (e) {
        return Error(ServerException(response.data.toString()));
      }
    } else if (response.statusCode == 405) {
      return Error(MethodNotAllowedException(
          "${response.statusCode} ${response.data["Message"]} !"));
    } else if (response.statusCode == 404) {
      return Error(NotFoundException("${response.statusCode} Not Found !"));
    } else if (response.statusCode == 400) {
      return Error(BadRequestException("${response.statusCode} Bad Request !"));
    } else if (response.statusCode == 408) {
      return Error(
          RequestTimeOutException("${response.statusCode} Request Timeout !"));
    } else if (response.statusCode == 500) {
      return Error(ServerException(
          "${response.statusCode} ${response.data["Message"]} !"));
    } else {
      return Error(
          ServerException("${response.statusCode} Something went wrong !"));
    }
  }

  @override
  Future<Result<AllotedSlotResponseModel, AppException>>
      getCancelledSessionAllTherapist(
          {required String date, CancelToken? cancelToken}) async {
    final response =
        await iExecutiveApi.getCancelledSessionAllTherapist(date: date);
    if (response.statusCode == 200) {
      try {
        return Success(AllotedSlotResponseModel.fromJson(response.data));
      } catch (e) {
        return Error(ServerException(response.data.toString()));
      }
    } else if (response.statusCode == 405) {
      return Error(MethodNotAllowedException(
          "${response.statusCode} ${response.data["Message"]} !"));
    } else if (response.statusCode == 404) {
      return Error(NotFoundException("${response.statusCode} Not Found !"));
    } else if (response.statusCode == 400) {
      return Error(BadRequestException("${response.statusCode} Bad Request !"));
    } else if (response.statusCode == 408) {
      return Error(
          RequestTimeOutException("${response.statusCode} Request Timeout !"));
    } else if (response.statusCode == 500) {
      return Error(ServerException(
          "${response.statusCode} ${response.data["Message"]} !"));
    } else {
      return Error(
          ServerException("${response.statusCode} Something went wrong !"));
    }
  }

  @override
  Future<Result<TherapistNameModel, AppException>> getTherapistName(
      {CancelToken? cancelToken}) async {
    final response = await iExecutiveApi.getTherapistName();
    if (response.statusCode == 200) {
      try {
        return Success(TherapistNameModel.fromJson(response.data));
      } catch (e) {
        return Error(ServerException(response.data.toString()));
      }
    } else if (response.statusCode == 405) {
      return Error(MethodNotAllowedException(
          "${response.statusCode} ${response.data["Message"]}"));
    } else if (response.statusCode == 400) {
      return Error(BadRequestException("${response.statusCode} Bad Request !"));
    } else if (response.statusCode == 408) {
      return Error(
          RequestTimeOutException("${response.statusCode} Request Timeout !"));
    } else if (response.statusCode == 500) {
      return Error(
          ServerException("${response.statusCode} Internal server error !!"));
    } else {
      return Error(
          ServerException("${response.statusCode} Something went wrong !"));
    }
  }

  @override
  Future<Result<SlotTimeModel, AppException>> getSlotTime(
      {CancelToken? cancelToken}) async {
    final response = await iExecutiveApi.getSlotTime(cancelToken: cancelToken);
    if (response.statusCode == 200) {
      try {
        return Success(SlotTimeModel.fromJson(response.data));
      } catch (e) {
        return Error(ServerException(response.data.toString()));
      }
    } else if (response.statusCode == 405) {
      return Error(MethodNotAllowedException(
          "${response.statusCode} ${response.data["Message"]}"));
    } else if (response.statusCode == 400) {
      return Error(BadRequestException("${response.statusCode} Bad Request !"));
    } else if (response.statusCode == 408) {
      return Error(
          RequestTimeOutException("${response.statusCode} Request Timeout !"));
    } else if (response.statusCode == 500) {
      return Error(
          ServerException("${response.statusCode} Internal server error !!"));
    } else {
      return Error(
          ServerException("${response.statusCode} Something went wrong !"));
    }
  }

  @override
  Future<Result<String, AppException>> changeTherapist(
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
    if (response.statusCode == 200) {
      try {
        return Success(response.data.toString());
      } catch (e) {
        return Error(ServerException(response.data.toString()));
      }
    } else if (response.statusCode == 405) {
      return Error(MethodNotAllowedException(
          "${response.statusCode} ${response.data["Message"]}"));
    } else if (response.statusCode == 400) {
      return Error(BadRequestException("${response.statusCode} Bad Request !"));
    } else if (response.statusCode == 408) {
      return Error(
          RequestTimeOutException("${response.statusCode} Request Timeout !"));
    } else if (response.statusCode == 500) {
      return Error(ServerException("${response.data["ExceptionMessage"]} !"));
    } else {
      return Error(
          ServerException("${response.statusCode} Something went wrong !"));
    }
  }

  @override
  Future<Result<String, AppException>> sessionReschedule({
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
    if (response.statusCode == 200) {
      try {
        return Success(response.data.toString());
      } catch (e) {
        return Error(ServerException(response.data.toString()));
      }
    }
    // else if (response.data["detail"].toString() ==
    //     "server error: status code 404") {
    //   return Error(NotFoundException("Slot Time Is Not Available"));
    // }
    else if (response.statusCode == 405) {
      return Error(MethodNotAllowedException(
          "${response.statusCode} ${response.data["Message"]}"));
    } else if (response.statusCode == 400) {
      return Error(BadRequestException("${response.statusCode} Bad Request !"));
    } else if (response.statusCode == 408) {
      return Error(
          RequestTimeOutException("${response.statusCode} Request Timeout !"));
    } else if (response.statusCode == 500) {
      return Error(ServerException("${response.data["ExceptionMessage"]} !"));
    } else {
      return Error(
          ServerException("${response.statusCode} Something went wrong !"));
    }
  }

  @override
  Future<Result<String, AppException>> exeCompleteSession(
      {required String userType,
      required String userId,
      required int slotId,
      CancelToken? cancelToken}) async {
    final response = await iExecutiveApi.exeCompleteSession(
        userType: userType, userId: userId, slotId: slotId);
    if (response.statusCode == 200) {
      try {
        return Success(response.data.toString());
      } catch (e) {
        return Error(ServerException(response.data.toString()));
      }
    } else if (response.statusCode == 405) {
      return Error(MethodNotAllowedException(
          "${response.statusCode} ${response.data["Message"]}"));
    } else if (response.statusCode == 400) {
      return Error(BadRequestException("${response.statusCode} Bad Request !"));
    } else if (response.statusCode == 408) {
      return Error(
          RequestTimeOutException("${response.statusCode} Request Timeout !"));
    } else if (response.statusCode == 500) {
      return Error(
          ServerException("${response.statusCode} Something went wrong  !"));
    } else {
      return Error(
          ServerException("${response.statusCode} Something went wrong !"));
    }
  }

  @override
  Future<Result<String, AppException>> exeStartSession(
      {required String userType,
      required String userId,
      required int slotId,
      CancelToken? cancelToken}) async {
    final response = await iExecutiveApi.exeStartSession(
        userType: userType, userId: userId, slotId: slotId);
    if (response.statusCode == 200) {
      try {
        return Success(response.data.toString());
      } catch (e) {
        return Error(ServerException(response.data.toString()));
      }
    } else if (response.statusCode == 405) {
      return Error(MethodNotAllowedException(
          "${response.statusCode} ${response.data["Message"]}"));
    } else if (response.statusCode == 400) {
      return Error(BadRequestException("${response.statusCode} Bad Request !"));
    } else if (response.statusCode == 408) {
      return Error(
          RequestTimeOutException("${response.statusCode} Request Timeout !"));
    } else if (response.statusCode == 500) {
      return Error(
          ServerException("${response.statusCode} Something went wrong  !"));
    } else {
      return Error(
          ServerException("${response.statusCode} Something went wrong !"));
    }
  }

  @override
  Future<Result<String, AppException>> resumeCancelledSession(
      {required String userType,
      required String userId,
      required int slotId,
      CancelToken? cancelToken}) async {
    final response = await iExecutiveApi.resumeCancelledSession(
        userType: userType, userId: userId, slotId: slotId);
    if (response.statusCode == 200) {
      try {
        return Success(response.data.toString());
      } catch (e) {
        return Error(ServerException(response.data.toString()));
      }
    } else if (response.statusCode == 405) {
      return Error(MethodNotAllowedException(
          "${response.statusCode} ${response.data["Message"]}"));
    } else if (response.statusCode == 400) {
      return Error(BadRequestException("${response.statusCode} Bad Request !"));
    } else if (response.statusCode == 408) {
      return Error(
          RequestTimeOutException("${response.statusCode} Request Timeout !"));
    } else if (response.statusCode == 500) {
      return Error(
          ServerException("${response.statusCode} Something went wrong  !"));
    } else {
      return Error(
          ServerException("${response.statusCode} Something went wrong !"));
    }
  }

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
