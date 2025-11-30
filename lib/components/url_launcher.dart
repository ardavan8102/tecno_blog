import 'dart:developer';

import 'package:tecno_blog/components/snackbars.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launcherUrlMethod(String url) async {
  try {
    final uri = Uri.parse(url.trim());

    if (!uri.isScheme("http") &&
        !uri.isScheme("https") &&
        !uri.isScheme("tel") &&
        !uri.isScheme("mailto")) {
      AppSnackBars.failed('لینک معتبر نیست');
      return;
    }

    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);

    if (!launched) {
      AppSnackBars.failed('خطایی در دریافت لینک');
    }
  } catch (e) {
    AppSnackBars.failed('خطایی در پردازش');
    log('>>> launcher error: $e');
  }
}
