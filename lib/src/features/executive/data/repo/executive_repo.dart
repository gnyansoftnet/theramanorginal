import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/core/exception/app_exception.dart';
import 'package:theraman/src/features/executive/data/apis/i_executive_api.dart';
import 'package:theraman/src/features/executive/data/repo/i_executive_repo.dart';
import 'package:theraman/src/features/therapist/model/leave_details_model.dart';
import 'package:theraman/src/global/model/tomorrow_session_model.dart';

class ExecutiveRepo extends IExecutiveRepo {
  final IExecutiveApi iExecutiveApi;
  ExecutiveRepo({required this.iExecutiveApi});

  @override
  Future<Result<TomorrowSessionModel, AppException>> getTomorrowSession(
      {required String date, CancelToken? cancelToken}) async {
    final response = await iExecutiveApi.getTomorrowSession(date: date);
    if (response.statusCode == 200) {
      try {
        return Success(TomorrowSessionModel.fromJson(response.data));
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
}
