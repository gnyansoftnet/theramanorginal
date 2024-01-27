import 'package:dio/dio.dart';

abstract class IAuthApi {
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

  Future<Response> signin({
    required String mobileNo,
    required String password,
    required String userType,
    CancelToken? cancelToken,
  });
}
