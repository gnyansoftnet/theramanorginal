import 'package:dio/dio.dart';
import 'package:theraman/src/features/authentication/data/apis/i_login_api.dart';

class LoginApi extends ILoginApi {
  final Dio dio;
  LoginApi({required this.dio});
  @override
  Future<Response> sendOtp(
      {required String mobileNo,
      required String userType,
      CancelToken? cancelToken}) async {
    return await dio.post(
        'http://cms.softnetcms.com/Api/MApp_ServicesApi/RegisterUser/?Mobile_No=$mobileNo&Type=$userType');
  }

  @override
  Future<Response> verifyOtp(
      {required String mobileNo,
      required String otp,
      required String userType,
      CancelToken? cancelToken}) async {
    return await dio.post(
        "http://cms.softnetcms.com/Api/MApp_ServicesApi/VerifyOTP/?Mobile_No=$mobileNo&Type=$userType&Otp=$otp");
  }
}
