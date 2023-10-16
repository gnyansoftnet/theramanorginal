import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/data/apis/i_login_api.dart';
import 'package:theraman/src/features/authentication/data/apis/login_api.dart';
import 'package:theraman/src/global/api_client/dio_client_pod.dart';

final loginAPiProvider = Provider.autoDispose<ILoginApi>(
  (ref) => LoginApi(
    dio: ref.watch(dioProvider),
  ),
);
