import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openMap(double? lat, double? lng) async {
  if (lat == null || lng == null) {
    debugPrint('❌ lat or lng is null');
    return;
  }

  // ✅ نستخدم geo: لفتح Google Maps مباشرة على Android
  final Uri uri = Uri.parse("geo:$lat,$lng?q=$lat,$lng");

  debugPrint('🗺️ Trying to open: $uri');

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    // ✅ fallback: فتح Google Maps عبر المتصفح
    final Uri webUri = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=$lat,$lng",
    );

    debugPrint('🌐 Falling back to web: $webUri');

    if (await canLaunchUrl(webUri)) {
      await launchUrl(webUri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('❌ Could not launch any map');
    }
  }
}