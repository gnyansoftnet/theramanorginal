import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/core/exception/app_exception.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';

abstract class IExecutiveDashboardRepo {
  Future<Result<AllotedSlotResponseModel, AppException>>
      getCompletedSlotAllTherapist(
          {required String date, CancelToken? cancelToken});
  Future<Result<AllotedSlotResponseModel, AppException>>
      getAllotedSlotAllTherapist(
          {required String date, CancelToken? cancelToken});
}
