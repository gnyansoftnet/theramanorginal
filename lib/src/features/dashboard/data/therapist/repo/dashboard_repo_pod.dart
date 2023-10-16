import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/dashboard/data/therapist/apis/dashboard_api_pod.dart';
import 'package:theraman/src/features/dashboard/data/therapist/repo/dashboard_repo.dart';
import 'package:theraman/src/features/dashboard/data/therapist/repo/i_dashboard_repo.dart';

final dashboardRepoProvider = Provider.autoDispose<IDashboardRepo>(
    (ref) => DashboardRepo(iDashboardApi: ref.watch(dashboardApiProvider)));
