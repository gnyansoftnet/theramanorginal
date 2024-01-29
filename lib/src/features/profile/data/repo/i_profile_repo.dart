import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:theraman/src/global/exception/api_exception.dart';

abstract class IProfileRepo {
  Future<Result<String, APIException>> changePassword(
      {required String userType,
      required String staffCode,
      required String currPass,
      required String newPass,
      CancelToken? cancelToken});
}
