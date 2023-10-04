import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/features/authentication/data/apis/send_otp/i_send_otp_api.dart';

import 'package:theraman/src/features/authentication/data/repo/i_login_repo.dart';

class LoginRepo extends ILoginRepo {
  final ISendOtpApi iSendOtpApi;
  LoginRepo({required this.iSendOtpApi});

  @override
  Future<Result<String, Exception>> sendOtp({
    required String mobileNo,
    CancelToken? cancelToken,
  }) async {
    print("mobile number :$mobileNo");
    final response = await iSendOtpApi.sendOtp(
      mobileNo: mobileNo,
      cancelToken: cancelToken,
    );

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
}
