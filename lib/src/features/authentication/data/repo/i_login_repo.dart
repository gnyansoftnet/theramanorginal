import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/features/authentication/model/user_model.dart';

abstract class ILoginRepo {
  Future<Result<String, Exception>> sendOtp({
    required String mobileNo,
    required String userType,
    CancelToken? cancelToken,
  });
  Future<Result<UserModel, Exception>> verifyOtp({
    required String mobileNo,
    required String otp,
    required String userType,
    CancelToken? cancelToken,
  });
}
