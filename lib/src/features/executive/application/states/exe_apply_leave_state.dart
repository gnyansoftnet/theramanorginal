import 'package:flutter/material.dart';

@immutable
sealed class ExeApplyLeaveState {
  const ExeApplyLeaveState();
}

class ExeApplyLeaveInitial implements ExeApplyLeaveState {
  const ExeApplyLeaveInitial() : super();
}

class ExeApplyLeaveLoading implements ExeApplyLeaveState {
  const ExeApplyLeaveLoading() : super();
}

class ExeApplyLeaveLoaded implements ExeApplyLeaveState {
  const ExeApplyLeaveLoaded() : super();
}
