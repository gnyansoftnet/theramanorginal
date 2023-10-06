import 'package:dio/dio.dart';

abstract class IUserApi {
  Future<Response> getUserDetails({
    required userId,
    required userType,
    CancelToken? cancelToken,
  });
}
