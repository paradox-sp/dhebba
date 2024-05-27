import 'package:nylo_framework/nylo_framework.dart';
import 'package:url_launcher/url_launcher.dart';

import '/app/controllers/controller.dart';

// import 'package:flutter/widgets.dart';

class BankController extends Controller {
  String get baseUrl => getEnv('API_BASE_URL');
  onTapload() async {
    await launchUrl(Uri.parse(baseUrl + "/bank/load_with_bank_account"));
  }

  onTapsend() async {
    await launchUrl(Uri.parse(baseUrl + "/topup/send_amount"));
  }
}
