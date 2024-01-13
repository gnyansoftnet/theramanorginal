import 'package:flutter/material.dart';

@immutable
sealed class ChangeTherapistState {
  const ChangeTherapistState();
}

class ChangeTherapistInitial implements ChangeTherapistState {
  const ChangeTherapistInitial() : super();
}

class ChangeTherapistLoading implements ChangeTherapistState {
  const ChangeTherapistLoading() : super();
}

class ChangeTherapistLoaded implements ChangeTherapistState {
  const ChangeTherapistLoaded() : super();
}
