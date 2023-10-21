import 'package:dio/dio.dart';
import 'package:theraman/src/features/executive/data/apis/i_executive_api.dart';
import 'package:theraman/src/utils/constants/app_urls.dart';

class ExecutiveApi extends IExecutiveApi {
  final Dio dio;
  ExecutiveApi({required this.dio});
  @override
  Future<Response> getTomorrowSession(
      {required date, CancelToken? cancelToken}) async {
    return dio.get("${AppUrls.exeTomorrowSessionUrl}Session_Date=$date");
  }

  @override
  Future<Response> getAllTherapistLeaveDetail(
      {required fromDate, required toDate, CancelToken? cancelToken}) async {
    return await dio.get(
        "${AppUrls.therapistLeaveDetailUrl}From_Date=$fromDate&To_Date=$toDate");
  }
}
