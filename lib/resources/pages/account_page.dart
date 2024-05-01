import 'package:flutter/material.dart';
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
              },
              icon: Icon(Icons.person),
              label: Text('My Information'),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to Pay Records screen
              },
              icon: Icon(Icons.account_balance_wallet),
              label: Text('Pay Records'),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to App Usage screen
              },
              icon: Icon(Icons.insert_chart),
              label: Text('App Usage'),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Perform logout functionality
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
