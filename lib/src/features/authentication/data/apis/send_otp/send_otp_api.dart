import 'package:dio/dio.dart';
import 'package:theraman/src/features/authentication/data/apis/send_otp/i_send_otp_api.dart';

class SendOtpApi extends ISendOtpApi {
  final Dio dio;
  SendOtpApi({required this.dio});
  @override
  Future<Response> sendOtp(
      {required String mobileNo, CancelToken? cancelToken}) async {
    return await dio.post(
        'http://cms.softnetcms.com/Api/MApp_ServicesApi/RegisterUser/?Mobile_No=$mobileNo&Type=T');
  }
  // 8249246758
}
