import 'package:flutter/material.dart';

@immutable
sealed class VerifyOtpState {
  const VerifyOtpState();
}

class VerifyOtpInitial implements VerifyOtpState {
  const VerifyOtpInitial() : super();
}

class VerifyOtpLoading implements VerifyOtpState {
  const VerifyOtpLoading() : super();
}

class VerifyOtpLoaded implements VerifyOtpState {
  // final UserModel userModel;
  // const VerifyOtpLoaded({required this.userModel}) : super();
  const VerifyOtpLoaded() : super();
}
