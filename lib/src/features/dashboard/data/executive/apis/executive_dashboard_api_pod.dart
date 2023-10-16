import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/dashboard/data/executive/apis/executive_dashboard_api.dart';
import 'package:theraman/src/features/dashboard/data/executive/apis/i_executive_dashboard_api.dart';
import 'package:theraman/src/global/api_client/dio_client_pod.dart';

final executiveDashboardApiProvider =
    Provider.autoDispose<IExecutiveDashboardApi>(
        (ref) => ExecutiveDashboardApi(dio: ref.watch(dioProvider)));
