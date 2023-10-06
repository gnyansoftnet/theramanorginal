import 'package:dio/dio.dart';
import 'package:theraman/src/features/dashboard/data/apis/i_dashboard_api.dart';
import 'package:theraman/src/utils/constants/app_urls.dart';

class DashboardApi extends IDashboardApi {
  final Dio dio;
  DashboardApi({required this.dio});
  @override
  Future<Response> getAllotedSlotDetails(
      {required userId, CancelToken? cancelToken}) async {
    return await dio.get("${AppUrls.getAllotedSlotDetails}/?User_Id=$userId");
  }
}
