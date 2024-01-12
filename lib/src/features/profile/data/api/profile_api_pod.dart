import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/profile/data/api/i_profile_api.dart';
import 'package:theraman/src/features/profile/data/api/profile_api.dart';
import 'package:theraman/src/global/api_client/dio_client_pod.dart';

final profileApiPod = Provider.autoDispose<IProfileApi>(
    (ref) => ProfileApi(dio: ref.watch(dioProvider)));
