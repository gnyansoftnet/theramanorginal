import 'package:dio/dio.dart';

abstract class ILoginApi {
  Future<Response> sendOtp({
    required String mobileNo,
    required String userType,
    CancelToken? cancelToken,
  });
  Future<Response> verifyOtp({
    required String mobileNo,
    required String otp,
    required String userType,
    CancelToken? cancelToken,
  });
}
