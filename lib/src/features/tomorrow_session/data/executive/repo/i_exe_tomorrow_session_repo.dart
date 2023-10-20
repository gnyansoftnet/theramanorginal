import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/core/exception/app_exception.dart';
import 'package:theraman/src/global/model/tomorrow_session_model.dart';

abstract class IExeTomorrowSessionRepo {
  Future<Result<TomorrowSessionModel, AppException>> getTomorrowSession({
    required String date,
    CancelToken? cancelToken,
  });
}
