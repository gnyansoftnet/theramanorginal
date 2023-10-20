import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/tomorrow_session/data/executive/apis/exe_tomorrow_session_api_pod.dart';

import 'package:theraman/src/features/tomorrow_session/data/executive/repo/exe_tomorrow_session_repo.dart';
import 'package:theraman/src/features/tomorrow_session/data/executive/repo/i_exe_tomorrow_session_repo.dart';

final exeTomorrowSessionRepoProvider =
    Provider.autoDispose<IExeTomorrowSessionRepo>((ref) =>
        ExeTomorowSessionRepo(
            iExeTomorrowSessionApi: ref.watch(exeTomorrowSessionApiProvider)));
