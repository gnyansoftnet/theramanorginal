import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/data/apis/send_otp/send_otp_api_pod.dart';
import 'package:theraman/src/features/authentication/data/repo/i_login_repo.dart';
import 'package:theraman/src/features/authentication/data/repo/login_repo.dart';

final loginRepoProvider = Provider.autoDispose<ILoginRepo>(
  (ref) => LoginRepo(
    iSendOtpApi: ref.watch(sendOtpAPiProvider),
  ),
);
