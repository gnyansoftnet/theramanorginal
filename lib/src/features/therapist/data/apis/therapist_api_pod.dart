import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/therapist/data/apis/i_therapist_api.dart';
import 'package:theraman/src/features/therapist/data/apis/therapist_api.dart';
import 'package:theraman/src/global/api_client/dio_client_pod.dart';

final therapistApiProvider = Provider.autoDispose<ITherapistApi>(
    (ref) => TherapistApi(dio: ref.watch(dioProvider)));
