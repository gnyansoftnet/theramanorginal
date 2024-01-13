import 'package:flutter/material.dart';

@immutable
sealed class CancelSessionState {
  const CancelSessionState();
}

class CancelSessionInitial implements CancelSessionState {
  const CancelSessionInitial() : super();
}

class CancelSessionLoading implements CancelSessionState {
  const CancelSessionLoading() : super();
}

class CancelSessionLoaded implements CancelSessionState {
  const CancelSessionLoaded() : super();
}
