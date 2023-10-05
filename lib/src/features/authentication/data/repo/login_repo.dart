import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/features/authentication/data/apis/i_login_api.dart';

import 'package:theraman/src/features/authentication/data/repo/i_login_repo.dart';

import '../../model/user_model.dart';

class LoginRepo extends ILoginRepo {
  final ILoginApi iLoginApi;
  LoginRepo({required this.iLoginApi});

  @override
  Future<Result<String, Exception>> sendOtp({
    required String mobileNo,
    required String userType,
    CancelToken? cancelToken,
  }) async {
    print("mobile number :$mobileNo");
    final response = await iLoginApi.sendOtp(
        mobileNo: mobileNo, cancelToken: cancelToken, userType: userType);

    if (response.statusCode == 200) {
      try {
        return const Success("Otp send successfully");
      } catch (e) {
        return Error(Exception());
      }
    } else {
      return Error(Exception());
    }
  }

  @override
  Future<Result<UserModel, Exception>> verifyOtp(
      {required String mobileNo,
      required String otp,
      required String userType,
      CancelToken? cancelToken}) async {
    print("mobile number :$mobileNo");
    final response = await iLoginApi.verifyOtp(
      mobileNo: mobileNo,
      otp: otp,
      userType: userType,
      cancelToken: cancelToken,
    );

    if (response.statusCode == 200) {
      try {
        return Success(UserModel.fromJson(response.data));
        print(UserModel.fromJson(response.data["id"]));
      } catch (e) {
        return Error(Exception());
      }
    } else {
      return Error(Exception());
    }
  }
}
