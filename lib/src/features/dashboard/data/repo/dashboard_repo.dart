import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/features/dashboard/data/apis/i_dashboard_api.dart';
import 'package:theraman/src/features/dashboard/model/alloted_slot_response.dart';
import 'i_dashboard_repo.dart';

class DashboardRepo extends IDashboardRepo {
  final IDashboardApi iDashboardApi;
  DashboardRepo({required this.iDashboardApi});

  @override
  Future<Result<AllotedSlotResponse, Exception>> getAllotedSlotDetails({
    required String userId,
    CancelToken? cancelToken,
  }) async {
    final response = await iDashboardApi.getAllotedSlotDetails(
        userId: userId, cancelToken: cancelToken);

    if (response.statusCode == 200) {
      try {
        return Success(AllotedSlotResponse.fromJson(response.data));
      } catch (e) {
        return Error(Exception());
      }
    } else {
      return Error(Exception());
    }
  }

  @override
  Future<Result<String, Exception>> startSession(
      {required String userId,
      required String userType,
      CancelToken? cancelToken}) async {
    final response = await iDashboardApi.startSession(
        userId: userId, userType: userType, cancelToken: cancelToken);

    if (response.statusCode == 200) {
      try {
        return const Success("Session Started");
      } catch (e) {
        return Error(Exception());
      }
    } else {
      return Error(Exception());
    }
  }

  @override
  Future<Result<String, Exception>> completeSession(
      {required String userId,
      required String userType,
      CancelToken? cancelToken}) async {
    final response = await iDashboardApi.completeSession(
        userId: userId, userType: userType, cancelToken: cancelToken);

    if (response.statusCode == 200) {
      try {
        return const Success("Session Completed");
      } catch (e) {
        return Error(Exception());
      }
    } else {
      return Error(Exception());
    }
  }
}
