import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/core/exception/app_exception.dart';
import 'package:theraman/src/features/tomorrow_session/data/executive/apis/i_exe_tomorrow_session_api.dart';
import 'package:theraman/src/features/tomorrow_session/data/executive/repo/i_exe_tomorrow_session_repo.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/global/model/tomorrow_session_model.dart';

class ExeTomorowSessionRepo extends IExeTomorrowSessionRepo {
  final IExeTomorrowSessionApi iExeTomorrowSessionApi;
  ExeTomorowSessionRepo({required this.iExeTomorrowSessionApi});

  @override
  Future<Result<TomorrowSessionModel, AppException>> getTomorrowSession(
      {required String date, CancelToken? cancelToken}) async {
    final response =
        await iExeTomorrowSessionApi.getTomorrowSession(date: date);
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
}
