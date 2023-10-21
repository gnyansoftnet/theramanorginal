import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/core/exception/app_exception.dart';
import 'package:theraman/src/features/therapist/model/leave_details_model.dart';
import 'package:theraman/src/global/model/tomorrow_session_model.dart';

abstract class IExecutiveRepo {
  Future<Result<TomorrowSessionModel, AppException>> getTomorrowSession({
    required String date,
    CancelToken? cancelToken,
  });
  Future<Result<LeaveDetailsModel, AppException>> getAllTherapistLeaveDetail(
      {required fromDate, required toDate, CancelToken? cancelToken});
}
