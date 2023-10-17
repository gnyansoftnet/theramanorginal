import 'package:dio/dio.dart';
import 'package:theraman/src/features/dashboard/data/executive/apis/i_executive_dashboard_api.dart';
import 'package:theraman/src/utils/constants/app_urls.dart';

class ExecutiveDashboardApi extends IExecutiveDashboardApi {
  final Dio dio;
  ExecutiveDashboardApi({required this.dio});
  @override
  Future<Response> getCompletedSlotAllTherapist(
      {required date, CancelToken? cancelToken}) async {
    return await dio
        .get("${AppUrls.getCompletedSlotAllTherapistUrl}&Session_Date=$date");
  }

  @override
  Future<Response> getAllotedSlotAllTherapist(
      {required date, CancelToken? cancelToken}) async {
    return await dio
        .get("${AppUrls.getAllotedSlotAllTherapistUrl}&Session_Date=$date");
  }
}
