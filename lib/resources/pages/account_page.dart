import 'package:flutter/material.dart';
import 'package:flutter_app/resources/pages/appusage_page.dart';
import 'package:flutter_app/resources/pages/profile_page.dart';
import 'package:flutter_app/resources/pages/signin_page.dart';
import 'package:flutter_app/resources/pages/statement_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AccountPage extends NyStatefulWidget {
  static const path = '/account';

  AccountPage({super.key}) : super(path, child: _AccountPageState());
}

class _AccountPageState extends NyState<AccountPage> {
  @override
  init() async {}

  /// Use boot if you need to load data before the [view] is rendered.
  // @override
  // boot() async {
  //
  // }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to My Information screen
                routeTo(ProfilePage.path);
              },
              icon: Icon(Icons.person),
              label: Text('My Information'),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                routeTo(StatementPage.path);
                // Navigate to Pay Records screen
              },
              icon: Icon(Icons.account_balance_wallet),
              label: Text('Pay Records'),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                routeTo(AppusagePage.path); // Navigate to App Usage screen
              },
              icon: Icon(Icons.insert_chart),
              label: Text('App Usage'),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () async {
                await Auth.remove();
                NyStorage.deleteCollection("userid");
                routeTo(SigninPage.path,
                    navigationType: NavigationType.pushAndForgetAll);
              },
              icon: Icon(Icons.logout),
              label: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
