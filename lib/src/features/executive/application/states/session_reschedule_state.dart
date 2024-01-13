import 'package:flutter/material.dart';

@immutable
sealed class SessionRescheduleState {
  const SessionRescheduleState();
}

class SessionRescheduleInitial implements SessionRescheduleState {
  const SessionRescheduleInitial() : super();
}

class SessionRescheduleLoading implements SessionRescheduleState {
  const SessionRescheduleLoading() : super();
}

class SessionRescheduleLoaded implements SessionRescheduleState {
  const SessionRescheduleLoaded() : super();
}
