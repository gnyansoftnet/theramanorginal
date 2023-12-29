import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/data/apis/i_auth_api.dart';
import 'package:theraman/src/features/authentication/data/apis/auth_api.dart';
import 'package:theraman/src/global/api_client/dio_client_pod.dart';

final authApiProvider = Provider.autoDispose<IAuthApi>(
  (ref) => AuthApi(
    dio: ref.watch(dioProvider),
  ),
);
