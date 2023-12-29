import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/data/apis/auth_api_pod.dart';
import 'package:theraman/src/features/authentication/data/repo/i_auth_repo.dart';
import 'package:theraman/src/features/authentication/data/repo/auth_repo.dart';

final authRepoProvider = Provider.autoDispose<IAuthRepo>(
  (ref) => AuthRepo(
    iLoginApi: ref.watch(authApiProvider),
  ),
);
