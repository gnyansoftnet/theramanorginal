import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/features/authentication/data/apis/i_login_api.dart';
import 'package:theraman/src/features/authentication/data/repo/i_login_repo.dart';
import 'package:theraman/src/utils/local_store/preferences.dart';
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
        return Success(UserModel.fromJson(response.data));
      } catch (e) {
        return Error(Exception());
      }
    } else {
      return Error(Exception());
    }
  }
}
