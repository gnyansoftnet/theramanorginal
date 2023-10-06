import 'package:dio/dio.dart';

import 'package:theraman/src/features/user/data/apis/i_user_api.dart';
import 'package:theraman/src/utils/constants/app_urls.dart';

class UserApi extends IUserApi {
  final Dio dio;
  UserApi({required this.dio});

  @override
  Future<Response> getUserDetails(
      {required userId, required userType, CancelToken? cancelToken}) async {
    return await dio
        .get("${AppUrls.getUserDetails}/?User_Id=$userId&Type=$userType");
  }
}
