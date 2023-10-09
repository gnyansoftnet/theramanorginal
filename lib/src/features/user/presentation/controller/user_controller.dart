import 'package:url_launcher/url_launcher.dart';

class UserController {
  Future<void> redirectLink(
      {required String value, required String action}) async {
    final Uri launchUri = Uri(
      // scheme: 'tel',
      scheme: action,
      path: value,
    );
    await launchUrl(launchUri);
  }
}
