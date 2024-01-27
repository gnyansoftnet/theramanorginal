import 'package:flutter/material.dart';

@immutable
sealed class SigninState {
  const SigninState();
}

class SigninInitial implements SigninState {
  const SigninInitial() : super();
}

class SigninLoading implements SigninState {
  const SigninLoading() : super();
}

class SigninLoaded implements SigninState {
  const SigninLoaded() : super();
}
