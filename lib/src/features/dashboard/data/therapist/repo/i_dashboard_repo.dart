import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/core/exception/app_exception.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';

abstract class IDashboardRepo {
  Future<Result<AllotedSlotResponseModel, AppException>> getAllotedSlotDetails({
    required String userId,
    required String date,
    CancelToken? cancelToken,
  });
  Future<Result<AllotedSlotResponseModel, AppException>> getCompletedSession({
    required String userId,
    required String date,
    CancelToken? cancelToken,
  });

  Future<Result<String, AppException>> startSession({
    required String userId,
    required int slotId,
    required String userType,
    CancelToken? cancelToken,
  });
  Future<Result<String, AppException>> completeSession({
    required int slotId,
    required String userId,
    required String userType,
    CancelToken? cancelToken,
  });
}
