import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/dashboard/data/executive/apis/executive_dashboard_api_pod.dart';
import 'package:theraman/src/features/dashboard/data/executive/repo/executive_dashboard_repo.dart';
import 'package:theraman/src/features/dashboard/data/executive/repo/i_executive_dashboard_repo.dart';

final executivedashboardRepoProvider =
    Provider.autoDispose<IExecutiveDashboardRepo>((ref) =>
        ExecutiveDashboardRepo(
            iExecutiveDashboardApi: ref.watch(executiveDashboardApiProvider)));
