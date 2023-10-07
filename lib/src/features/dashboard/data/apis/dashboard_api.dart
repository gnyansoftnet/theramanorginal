import 'package:dio/dio.dart';
import 'package:theraman/src/features/dashboard/data/apis/i_dashboard_api.dart';
import 'package:theraman/src/utils/constants/app_urls.dart';

class DashboardApi extends IDashboardApi {
  final Dio dio;
  DashboardApi({required this.dio});
  @override
  Future<Response> getAllotedSlotDetails(
      {required userId, CancelToken? cancelToken}) async {
    return await dio
        .get("${AppUrls.getAllotedSlotDetailsUrl}/?User_Id=$userId");
  }

  @override
  Future<Response> startSession(
      {required userId, required userType, CancelToken? cancelToken}) async {
    return await dio
        .post("${AppUrls.startSessionUrl}/?Id=$userId&Type=$userType");
  }

  @override
  Future<Response> completeSession(
      {required userId, required userType, CancelToken? cancelToken}) async {
    return await dio
        .post("${AppUrls.completeSessionUrl}/?Id=$userId&Type=$userType");
  }
}
// http://cms.softnetcms.com/Api/MApp_ServicesApi/SessionCompleted/?Id=1234&Type=T