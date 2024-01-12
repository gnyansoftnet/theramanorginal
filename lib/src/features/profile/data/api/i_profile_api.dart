import 'package:dio/dio.dart';

abstract class IProfileApi {
  Future<Response> changePassword(
      {required exeCode,
      required currPass,
      required newPass,
      CancelToken? cancelToken});
}
