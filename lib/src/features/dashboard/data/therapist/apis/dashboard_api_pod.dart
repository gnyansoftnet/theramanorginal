import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/dashboard/data/therapist/apis/dashboard_api.dart';
import 'package:theraman/src/features/dashboard/data/therapist/apis/i_dashboard_api.dart';
import 'package:theraman/src/global/api_client/dio_client_pod.dart';

final dashboardApiProvider = Provider.autoDispose<IDashboardApi>(
    (ref) => DashboardApi(dio: ref.watch(dioProvider)));
