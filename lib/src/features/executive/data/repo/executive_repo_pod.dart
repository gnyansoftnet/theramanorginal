import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/executive/data/apis/executive_api_pod.dart';

import 'package:theraman/src/features/executive/data/repo/executive_repo.dart';
import 'package:theraman/src/features/executive/data/repo/i_executive_repo.dart';

final executiveRepoProvider = Provider.autoDispose<IExecutiveRepo>(
    (ref) => ExecutiveRepo(iExecutiveApi: ref.watch(executiveApiProvider)));
