import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/features/authentication/model/user_model.dart';
import 'package:theraman/src/global/exception/api_exception.dart';
import 'package:theraman/src/features/authentication/data/apis/i_auth_api.dart';
import 'package:theraman/src/features/authentication/data/repo/i_auth_repo.dart';
import 'package:theraman/src/utils/extensions/ext.dart';

class AuthRepo extends IAuthRepo {
  final IAuthApi iLoginApi;
  AuthRepo({required this.iLoginApi});

  @override
  Future<Result<String, APIException>> sendOtp({
    required String mobileNo,
    required String userType,
    CancelToken? cancelToken,
  }) async {
    final response = await iLoginApi.sendOtp(
        mobileNo: mobileNo, cancelToken: cancelToken, userType: userType);
    return response.successErrorHandler(successMapper: (result) => result);
  }

  @override
  Future<Result<UserModel, APIException>> verifyOtp(
      {required String mobileNo,
      required String otp,
      required String userType,
      CancelToken? cancelToken}) async {
    final response = await iLoginApi.verifyOtp(
      mobileNo: mobileNo,
      otp: otp,
      userType: userType,
      cancelToken: cancelToken,
    );
    return response.successErrorHandler(
        successMapper: (result) => UserModel.fromMap(result));
  }
}
