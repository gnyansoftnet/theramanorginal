import 'package:flutter/material.dart';

@immutable
sealed class SendOtpState {
  const SendOtpState();
}

class SendOtpInitial implements SendOtpState {
  const SendOtpInitial() : super();
}

class SendOtpLoading implements SendOtpState {
  const SendOtpLoading() : super();
}

class SendOtpLoaded implements SendOtpState {
  const SendOtpLoaded() : super();
}
