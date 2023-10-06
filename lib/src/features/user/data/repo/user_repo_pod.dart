import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/user/data/apis/user_api_pod.dart';
import 'package:theraman/src/features/user/data/repo/i_user_repo.dart';
import 'package:theraman/src/features/user/data/repo/user_repo.dart';

final userRepoProvider = Provider.autoDispose<IUserRepo>(
    (ref) => UserRepo(iUserApi: ref.watch(userApiProvider)));
