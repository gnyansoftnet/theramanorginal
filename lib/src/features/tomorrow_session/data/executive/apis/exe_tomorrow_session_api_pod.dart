import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/tomorrow_session/data/executive/apis/exe_tomorrow_session_api.dart';
import 'package:theraman/src/features/tomorrow_session/data/executive/apis/i_exe_tomorrow_session_api.dart';
import 'package:theraman/src/global/api_client/dio_client_pod.dart';

final exeTomorrowSessionApiProvider =
    Provider.autoDispose<IExeTomorrowSessionApi>(
        (ref) => ExeTomorrowSessionApi(dio: ref.watch(dioProvider)));
