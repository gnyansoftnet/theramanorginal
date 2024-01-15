import 'package:dio/dio.dart';
import 'package:theraman/src/features/therapist/data/apis/i_therapist_api.dart';
import 'package:theraman/src/utils/constants/app_urls.dart';

class TherapistApi extends ITherapistApi {
  final Dio dio;
  TherapistApi({required this.dio});

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

  @override
  Future<Response> userApplyLeave(
      {required userId,
      required noOfDays,
      required fromDate,
      required toDate,
      required leaveType,
      required reason,
      CancelToken? cancelToken}) async {
    var formData = {
      "Staff_Code": userId,
      "No_Of_Days": noOfDays,
      "Leave_from": fromDate,
      "Leave_To": toDate,
      "Leave_Type": leaveType,
      "Reason": reason
    };
    return await dio.post(AppUrls.applyLeaveUrl, data: formData);
  }

  @override
  Future<Response> getleaveStatus(
      {required userId,
      required fromDate,
      required toDate,
      CancelToken? cancelToken}) async {
    return await dio.get(
        "${AppUrls.leaveStatusUrl}/?User_Id=$userId&From_Date=$fromDate&To_Date=$toDate");
  }

  @override
  Future<Response> getSessionSummary({
    required userId,
    required month,
    CancelToken? cancelToken,
  }) async {
    return await dio
        .get("${AppUrls.sessionReportUrl}/?Month=$month&User_Id=$userId");
  }

  @override
  Future<Response> getSessionSummaryDetail(
      {required userId, required month, CancelToken? cancelToken}) async {
    return await dio.get(
        "${AppUrls.sessionSummaryDetailsUrl}/?Month=$month&User_Id=$userId");
  }
}
