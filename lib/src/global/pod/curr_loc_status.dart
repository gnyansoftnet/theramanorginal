import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

final currLocStatus = FutureProvider.autoDispose<bool>((ref) async {
  double latitude = 20.287658309744206;
  double longitude = 85.84986192781479;
// 20.287658309744206, 85.84986192781479
  LocationPermission permission = await Geolocator.requestPermission();
  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    return false;
  } else {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    debugPrint("latitude${position.latitude}");
    debugPrint("longitude${position.longitude}");
    double distanceInMeters = Geolocator.distanceBetween(
        position.latitude, position.longitude, latitude, longitude);
    debugPrint("distance===$distanceInMeters");
    if (distanceInMeters <= 100) {
      return true;
    } else {
      return false;
    }
  }
});
