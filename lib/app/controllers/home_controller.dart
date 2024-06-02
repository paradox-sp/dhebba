import 'package:flutter/material.dart';
import '/resources/widgets/logo_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'controller.dart';

class HomeController extends Controller {
  onTapDocumentation() async {
    await launchUrl(
        Uri.parse("https://github.com/sriza-n/dhebba/blob/main/README.md"));
  }

  onTapGithub() async {
    await launchUrl(Uri.parse("https://github.com/sriza-n/dhebba"));
  }

  onTapChangeLog() async {
    await launchUrl(Uri.parse("https://github.com/sriza-n/dhebba/releases"));
  }

  onTapYouTube() async {
    await launchUrl(
        Uri.parse("https://youtu.be/wu4NYMmk8pk?si=Fe6vSa95E4Er9Qkh&t=27"));
  }

  showAbout() {
    showAboutDialog(
      context: context!,
      applicationName: getEnv('APP_NAME'),
      applicationIcon: const Logo(),
      applicationVersion: nyloVersion,
    );
  }
}
