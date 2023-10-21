import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/executive/data/apis/executive_api.dart';
import 'package:theraman/src/features/executive/data/apis/i_executive_api.dart';
import 'package:theraman/src/global/api_client/dio_client_pod.dart';

final executiveApiProvider = Provider.autoDispose<IExecutiveApi>(
    (ref) => ExecutiveApi(dio: ref.watch(dioProvider)));
