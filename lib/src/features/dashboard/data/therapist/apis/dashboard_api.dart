import 'package:dio/dio.dart';
import 'package:theraman/src/features/dashboard/data/therapist/apis/i_dashboard_api.dart';
import 'package:theraman/src/utils/constants/app_urls.dart';

class DashboardApi extends IDashboardApi {
  final Dio dio;
  DashboardApi({required this.dio});
  @override
  Future<Response> getAllotedSlotDetails(
      {required userId, required date, CancelToken? cancelToken}) async {
    return await dio.get(
        "${AppUrls.getAllotedSlotDetailsUrl}/?User_Id=$userId&Session_Status=A&Session_Date=$date");
  }

  @override
  Future<Response> getCompletedSession(
      {required userId, required date, CancelToken? cancelToken}) async {
    return await dio.get(
        "${AppUrls.getAllotedSlotDetailsUrl}/?User_Id=$userId&Session_Status=C&Session_Date=$date");
  }

  @override
  Future<Response> startSession(
      {required userId,
      required slotId,
      required userType,
      CancelToken? cancelToken}) async {
    return await dio.post(
        "${AppUrls.exeStartSessionUrl}Id=$slotId&Type=$userType&UserId=$userId");
  }

  @override
  Future<Response> completeSession(
      {required slotId,
      required userId,
      required userType,
      CancelToken? cancelToken}) async {
    return await dio.post(
        "${AppUrls.exeCompleteSessionUrl}Id=$slotId&Type=$userType&UserId=$userId");
  }
}
// http://cms.softnetcms.com/Api/MApp_ServicesApi/SessionCompleted/?Id=1234&Type=T