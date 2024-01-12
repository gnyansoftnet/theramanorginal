import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/profile/data/api/profile_api_pod.dart';
import 'package:theraman/src/features/profile/data/repo/i_profile_repo.dart';
import 'package:theraman/src/features/profile/data/repo/profile_repo.dart';


final profielRepoPod = Provider.autoDispose<IProfileRepo>(
    (ref) => ProfileRepo(iProfileApi: ref.watch(profileApiPod)));
