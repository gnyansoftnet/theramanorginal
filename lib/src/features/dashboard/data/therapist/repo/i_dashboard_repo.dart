import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/core/exception/app_exception.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';

abstract class IDashboardRepo {
  Stream<Result<AllotedSlotResponseModel, AppException>> getAllotedSlotDetails({
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
    required String userType,
    CancelToken? cancelToken,
  });
  Future<Result<String, AppException>> completeSession({
    required String userId,
    required String userType,
    CancelToken? cancelToken,
  });
}
