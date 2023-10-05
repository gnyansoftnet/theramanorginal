import 'dart:io';

import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AutoFillSmsNotifier extends StateNotifier<String?> {
  AutoFillSmsNotifier() : super(null);

  Future<void> initSmsListener() async {
    if (Platform.isAndroid) {
      String commingSms;
      try {
        commingSms = await AltSmsAutofill().listenForSms ?? "";
        state = commingSms.toString().split(" ")[10];
      } on PlatformException {}
    }
  }
}
