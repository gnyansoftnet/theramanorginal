import 'package:dio/dio.dart';

abstract class ISendOtpApi {
  Future<Response> sendOtp({
    required String mobileNo,
    CancelToken? cancelToken,
  });
}
