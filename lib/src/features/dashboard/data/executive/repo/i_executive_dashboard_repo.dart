import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/core/exception/app_exception.dart';
import 'package:theraman/src/features/dashboard/model/executive/completed_slot_all_therapist.dart';

abstract class IExecutiveDashboardRepo {
  Future<Result<CompletedSlotAllTherapistModel, AppException>>
      getCompletedSlotAllTherapist(
          {required String date, CancelToken? cancelToken});
}
