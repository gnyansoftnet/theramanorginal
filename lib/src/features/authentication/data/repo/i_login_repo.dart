import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class ILoginRepo {
  Future<Result<String, Exception>> sendOtp({
    required String mobileNo,
    CancelToken? cancelToken,
  });
}
