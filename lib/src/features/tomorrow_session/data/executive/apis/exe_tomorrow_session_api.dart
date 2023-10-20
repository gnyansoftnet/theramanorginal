import 'package:dio/dio.dart';
import 'package:theraman/src/features/tomorrow_session/data/executive/apis/i_exe_tomorrow_session_api.dart';
import 'package:theraman/src/utils/constants/app_urls.dart';

class ExeTomorrowSessionApi extends IExeTomorrowSessionApi {
  final Dio dio;
  ExeTomorrowSessionApi({required this.dio});
  @override
  Future<Response> getTomorrowSession(
      {required date, CancelToken? cancelToken}) async {
    return dio.get("${AppUrls.exeTomorrowSessionUrl}Session_Date=$date");
  }
}
