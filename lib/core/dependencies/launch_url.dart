import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

extension UrlLauncher on String {
  launchApp() async {
    try {
      final bool success = await launchUrl(Uri(scheme: "https", path: this));
      if (!success) Fluttertoast.showToast(msg: "Couldn't launch.");
    } catch (e) {
      log(e.toString());
      Fluttertoast.showToast(msg: "Couldn't launch.");
    }
  }
}
