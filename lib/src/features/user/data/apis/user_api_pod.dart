import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/user/data/apis/i_user_api.dart';
import 'package:theraman/src/features/user/data/apis/user_api.dart';
import 'package:theraman/src/global/api_client/dio_client_pod.dart';

final userApiProvider = Provider.autoDispose<IUserApi>(
    (ref) => UserApi(dio: ref.watch(dioProvider)));
