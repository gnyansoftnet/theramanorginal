import 'package:dio/dio.dart';
import 'package:theraman/src/features/profile/data/api/i_profile_api.dart';
import 'package:theraman/src/utils/constants/constant.dart';

class ProfileApi extends IProfileApi {
  final Dio dio;
  ProfileApi({required this.dio});

  @override
  Future<Response> changePassword(
      {required exeCode,
      required currPass,
      required newPass,
      CancelToken? cancelToken}) async {
    final formData = {
      "Exe_Code": exeCode,
      "Old_Password": currPass,
      "New_Password": newPass
    };

    return await dio.post(AppUrls.changeTherapistUrl, data: formData);
  }
}
