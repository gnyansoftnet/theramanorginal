import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/core/exception/app_exception.dart';
import 'package:theraman/src/features/authentication/data/apis/i_auth_api.dart';
import 'package:theraman/src/features/authentication/data/repo/i_auth_repo.dart';
import 'package:theraman/src/global/model/user_model.dart';
import 'package:theraman/src/utils/local_store/preferences.dart';

class AuthRepo extends IAuthRepo {
  final IAuthApi iLoginApi;
  AuthRepo({required this.iLoginApi});

  @override
  Future<Result<String, AppException>> sendOtp({
    required String mobileNo,
    required String userType,
    CancelToken? cancelToken,
  }) async {
    final response = await iLoginApi.sendOtp(
        mobileNo: mobileNo, cancelToken: cancelToken, userType: userType);
    if (response.statusCode == 200) {
      try {
        return Success(response.data.toString());
      } catch (e) {
        return Error(NotFoundException("Your account does not exist !"));
      }
    } else if (response.statusCode == 405) {
      return Error(MethodNotAllowedException(
          "${response.statusCode} ${response.data["Message"]} !"));
    } else if (response.statusCode == 404) {
      return Error(NotFoundException(
          "${response.statusCode} Your account does not exist !"));
    } else if (response.statusCode == 500) {
      return Error(
          ServerException("${response.statusCode} internal server error !"));
    } else {
      return Error(NotFoundException("Your account does not exist !"));
    }
  }

  @override
  Future<Result<String, AppException>> verifyOtp(
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

    if (response.statusCode == 200) {
      try {
        UserModel usermodel = UserModel(
          isLogin: true,
        );
        final user = UserModel.fromJson(response.data)..staffCode;
        Preferences.setPreference("staffCode", user.staffCode);
        Preferences.saveUser(usermodel);
        Preferences.setPreference("userType", userType);
        return Success(response.data.toString());
      } catch (e) {
        return Error(NotFoundException("Your account does not exist !"));
      }
    } else if (response.statusCode == 405) {
      return Error(MethodNotAllowedException(
          "${response.statusCode} ${response.data["Message"]} !"));
    } else if (response.statusCode == 404) {
      return Error(NotFoundException("${response.statusCode} OTP is wrong !"));
    } else if (response.statusCode == 500) {
      return Error(
          ServerException("${response.statusCode} internal server error !"));
    } else {
      return Error(NotFoundException("OTP is wrong !"));
    }
  }
}
