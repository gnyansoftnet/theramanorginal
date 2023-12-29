import 'package:dio/dio.dart';
import 'package:theraman/src/features/authentication/data/apis/i_auth_api.dart';
import 'package:theraman/src/utils/constants/app_urls.dart';

class AuthApi extends IAuthApi {
  final Dio dio;
  AuthApi({required this.dio});
  @override
  Future<Response> sendOtp(
      {required String mobileNo,
      required String userType,
      CancelToken? cancelToken}) async {
    return await dio
        .post('${AppUrls.sendOtpUrl}/?Mobile_No=$mobileNo&Type=$userType');
  }

  @override
  Future<Response> verifyOtp(
      {required String mobileNo,
      required String otp,
      required String userType,
      CancelToken? cancelToken}) async {
    return await dio.post(
        "${AppUrls.verifyOtpUrl}/?Mobile_No=$mobileNo&Type=$userType&Otp=$otp");
  }
}
