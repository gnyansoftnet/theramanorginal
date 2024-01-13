import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/therapist/data/apis/therapist_api_pod.dart';
import 'package:theraman/src/features/therapist/data/repo/i_therapist_repo.dart';
import 'package:theraman/src/features/therapist/data/repo/therapist_repo.dart';

final therapistRepoProvider = Provider.autoDispose<ITherapistRepo>(
    (ref) => TherapistRepo(iTherapistApi: ref.watch(therapistApiProvider)));
