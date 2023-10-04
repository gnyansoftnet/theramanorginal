import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/data/apis/send_otp/i_send_otp_api.dart';
import 'package:theraman/src/features/authentication/data/apis/send_otp/send_otp_api.dart';
import '../../../../../global/api_client/dio_client_pod.dart';

final sendOtpAPiProvider = Provider.autoDispose<ISendOtpApi>(
  (ref) => SendOtpApi(
    dio: ref.watch(dioProvider),
  ),
);
