import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/features/authentication/model/user_model.dart';
import 'package:theraman/src/global/exception/api_exception.dart';

abstract class IAuthRepo {
  Future<Result<String, APIException>> sendOtp({
    required String mobileNo,
    required String userType,
    CancelToken? cancelToken,
  });
  Future<Result<UserModel, APIException>> verifyOtp({
    required String mobileNo,
    required String otp,
    required String userType,
    CancelToken? cancelToken,
  });
}
