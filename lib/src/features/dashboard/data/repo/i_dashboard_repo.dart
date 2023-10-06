import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/features/dashboard/model/alloted_slot_response.dart';

abstract class IDashboardRepo {
  Future<Result<AllotedSlotResponse, Exception>> getAllotedSlotDetails({
    required String userId,
    CancelToken? cancelToken,
  });
}
