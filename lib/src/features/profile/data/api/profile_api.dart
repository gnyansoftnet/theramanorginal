import 'package:dio/dio.dart';
import 'package:theraman/src/features/profile/data/api/i_profile_api.dart';
import 'package:theraman/src/utils/constants/constant.dart';

class ProfileApi extends IProfileApi {
  final Dio dio;
  ProfileApi({required this.dio});

  @override
  Future<Response> changePassword(
      {required userType,
      required staffCode,
      required currPass,
      required newPass,
      CancelToken? cancelToken}) async {
    final formData = {
      "Type": userType,
      "Staff_Code": staffCode,
      "Old_Password": currPass,
      "New_Password": newPass
    };

    return await dio.post(AppUrls.changePassUrl, data: formData);
  }
}
