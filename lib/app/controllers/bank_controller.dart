import 'package:nylo_framework/nylo_framework.dart';
import 'package:url_launcher/url_launcher.dart';

import '/app/controllers/controller.dart';

// import 'package:flutter/widgets.dart';

class BankController extends Controller {
  // String get Url => getEnv('API_BASE_URL');
  // String Url = Backpack.instance.read('baseurl');
  onTapload() async {
    int userid = await NyStorage.read("userid");
    String Url = await NyStorage.read("baseurl");
    await launchUrl(Uri.parse(Url + '/bank/load_with_bank_account/${userid}'));
  }

  onTapsend() async {
    String Url = await NyStorage.read("baseurl");
    await launchUrl(Uri.parse(Url + "/topup/send_amount"));
  }
}
