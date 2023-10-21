import 'package:flutter/material.dart';

@immutable
sealed class ApplyLeaveState {
  const ApplyLeaveState();
}

class ApplyLeaveInitial implements ApplyLeaveState {
  const ApplyLeaveInitial() : super();
}

class ApplyLeaveLoading implements ApplyLeaveState {
  const ApplyLeaveLoading() : super();
}

class ApplyLeaveLoaded implements ApplyLeaveState {
  const ApplyLeaveLoaded() : super();
}
