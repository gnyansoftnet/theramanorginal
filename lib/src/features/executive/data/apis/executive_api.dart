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

  @override
  Future<Response> exeApplyLeave(
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
}
