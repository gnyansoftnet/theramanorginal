import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/utils/local_store/preferences.dart';

final checkUserTypePod = FutureProvider<String>((ref) async {
  return await Preferences.getPreference("userType", "");
});
