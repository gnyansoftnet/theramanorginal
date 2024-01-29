import 'package:dio/dio.dart';

abstract class IProfileApi {
  Future<Response> changePassword(
      {required userType,
      required staffCode,
      required currPass,
      required newPass,
      CancelToken? cancelToken});
}
