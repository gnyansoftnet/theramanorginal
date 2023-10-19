import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/core/exception/app_exception.dart';
import 'package:theraman/src/features/dashboard/model/executive/reason_model.dart';
import 'package:theraman/src/features/dashboard/model/executive/slot_time_model.dart';
import 'package:theraman/src/features/dashboard/model/executive/therapist_name_model.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';

abstract class IExecutiveDashboardRepo {
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
}
