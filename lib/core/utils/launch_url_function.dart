import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/animation.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(context, {required String url}) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    AnimatedSnackBar.material(
      "can't launch this url, please try again later'",
      type: AnimatedSnackBarType.error,
      animationCurve: Curves.fastEaseInToSlowEaseOut,
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
    ).show(context);
  }
}
