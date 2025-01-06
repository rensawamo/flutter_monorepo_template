import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher_string.dart';

class URLLauncherUtility {
  static Future<void> openBrowser(
    String url, {
    dynamic Function()? onResume,
  }) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(
        url,
        mode: LaunchMode.externalApplication,
      );
    } else {
      await onResume?.call();
    }
  }

  static Future<void> call(String tel) async {
    final uriString = 'tel:$tel';
    if (await canLaunchUrlString(uriString)) {
      await launchUrlString(uriString);
    }
  }

  static Future<void> openMap({
    required TargetPlatform targetPlatform,
    double? latitude,
    double? longitude,
  }) async {
    if (targetPlatform == TargetPlatform.iOS) {
      await openBrowser('https://maps.apple.com/?q=$latitude,$longitude');
    } else {
      await openBrowser(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude',
      );
    }
  }
}
