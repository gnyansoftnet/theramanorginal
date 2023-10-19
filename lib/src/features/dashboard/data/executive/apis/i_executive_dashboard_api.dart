import 'package:dio/dio.dart';

abstract class IExecutiveDashboardApi {
  Future<Response> getAllotedSlotAllTherapist(
      {required date, CancelToken? cancelToken});
  Future<Response> getCompletedSlotAllTherapist({
    required date,
    CancelToken? cancelToken,
  });
  Future<Response> getReason({CancelToken? cancelToken});
  Future<Response> getTherapistName({CancelToken? cancelToken});
  Future<Response> getSlotTime({CancelToken? cancelToken});

  Future<Response> cancelSession(
      {required userId,
      required userType,
      required slotId,
      required isAdjustable,
      required reason,
      CancelToken? cancelToken});
  Future<Response> getCancelledSessionAllTherapist(
      {required date, CancelToken? cancelToken});
  Future<Response> changeTherapist({
    required userType,
    required userId,
    required slotId,
    required therapistName,
    required reason,
    CancelToken? cancelToken,
  });

  Future<Response> sessionReschedule({
    required userType,
    required userId,
    required slotId,
    required therapistName,
    required reason,
    required slotTime,
    CancelToken? cancelToken,
  });
}
