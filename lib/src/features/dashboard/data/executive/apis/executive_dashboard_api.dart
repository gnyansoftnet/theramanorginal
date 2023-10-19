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

  @override
  Future<Response> getReason({CancelToken? cancelToken}) async {
    return await dio.get(AppUrls.reasonsUrl);
  }

  @override
  Future<Response> cancelSession(
      {required userId,
      required userType,
      required slotId,
      required isAdjustable,
      required reason,
      CancelToken? cancelToken}) async {
    var formData = {
      "User_Type": userType,
      "User_Id": userId,
      "Slot_Id": slotId,
      "Is_Adjustable": isAdjustable,
      "Reason_Id": reason
    };
    return await dio.post(AppUrls.sessionCancelUrl, data: formData);
  }

  @override
  Future<Response> getCancelledSessionAllTherapist(
      {required date, CancelToken? cancelToken}) async {
    return await dio
        .get("${AppUrls.getCancelledSlotAllTherapistUrl}&Session_Date=$date");
  }

  @override
  Future<Response> getTherapistName({CancelToken? cancelToken}) async {
    return await dio.get(AppUrls.therapistNameUrl);
  }

  @override
  Future<Response> getSlotTime({CancelToken? cancelToken}) async {
    return await dio.get(AppUrls.slotTimeUrl);
  }

  @override
  Future<Response> changeTherapist(
      {required userType,
      required userId,
      required slotId,
      required therapistName,
      required reason,
      CancelToken? cancelToken}) async {
    var formData = {
      "User_Type": userType,
      "User_Id": userId,
      "Slot_Id": slotId,
      "Staff_Code": therapistName,
      "Reason_Id": reason
    };
    return await dio.post(AppUrls.changeTherapistUrl, data: formData);
  }

  @override
  Future<Response> sessionReschedule(
      {required userType,
      required userId,
      required slotId,
      required therapistName,
      required reason,
      required slotTime,
      CancelToken? cancelToken}) async {
    var formDate = {
      "User_Type": userType,
      "User_Id": userId,
      "Slot_Id": slotId,
      "Slot_Time_Code": slotTime,
      "Staff_Code": therapistName,
      "Reason_Id": reason
    };
    return await dio.post(AppUrls.sessionRescheduleUrl, data: formDate);
  }
}
