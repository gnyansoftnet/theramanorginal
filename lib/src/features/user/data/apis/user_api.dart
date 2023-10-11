import 'package:dio/dio.dart';

import 'package:theraman/src/features/user/data/apis/i_user_api.dart';
import 'package:theraman/src/utils/constants/app_urls.dart';

class UserApi extends IUserApi {
  final Dio dio;
  UserApi({required this.dio});

  @override
  Future<Response> getUserDetails(
      {required userId, required userType, CancelToken? cancelToken}) async {
    return await dio
        .get("${AppUrls.getUserDetails}/?User_Id=$userId&Type=$userType");
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
    return await dio.post(AppUrls.applyLeave, data: formData);
  }

  @override
  Future<Response> getleaveStatus(
      {required userId,
      required fromDate,
      required toDate,
      CancelToken? cancelToken}) async {
    return await dio.get(
        "${AppUrls.leaveStatus}/?User_Id=$userId&From_Date=$fromDate&To_Date=$toDate");
  }
  // http://cms.softnetcms.com/Api/MApp_ServicesApi/GetAppliedLeaveDetails/?User_Id=THST5&From_Date=10/10/2023&To_Date=10/10/2023
}
