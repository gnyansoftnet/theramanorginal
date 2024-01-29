import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/features/profile/data/api/i_profile_api.dart';
import 'package:theraman/src/features/profile/data/repo/i_profile_repo.dart';
import 'package:theraman/src/global/exception/api_exception.dart';
import 'package:theraman/src/utils/extensions/ext.dart';

class ProfileRepo extends IProfileRepo {
  final IProfileApi iProfileApi;
  ProfileRepo({required this.iProfileApi});

  @override
  Future<Result<String, APIException>> changePassword(
      {required String userType,
      required String staffCode,
      required String currPass,
      required String newPass,
      CancelToken? cancelToken}) async {
    final response = await iProfileApi.changePassword(
        userType: userType,
        staffCode: staffCode,
        currPass: currPass,
        newPass: newPass,
        cancelToken: cancelToken);
    return response.successErrorHandler(successMapper: (result) => result);
  }
}
