import 'package:flutter/material.dart';

@immutable
sealed class ChangePasswordState {
  const ChangePasswordState();
}

class ChangePasswordInitial implements ChangePasswordState {
  const ChangePasswordInitial() : super();
}

class ChangePasswordLoading implements ChangePasswordState {
  const ChangePasswordLoading() : super();
}

class ChangePasswordLoaded implements ChangePasswordState {
  final String msg;
  const ChangePasswordLoaded({required this.msg}) : super();
}
