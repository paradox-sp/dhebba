import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../app/models/user.dart';

class ProfilePage extends NyStatefulWidget {
  static const path = '/profile';

  ProfilePage({super.key}) : super(path, child: _ProfilePageState());
}

class _ProfilePageState extends NyState<ProfilePage> {
  @override
  init() async {}

  /// Use boot if you need to load data before the [view] is rendered.
  // @override
  // boot() async {
  //
  // }

  @override
  Widget view(BuildContext context) {
    User? user = Backpack.instance.auth();
    print('user: $user');
    print('userId: ${user?.userId}');
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: SafeArea(
        child: Text(user?.userId.toString() ?? " "),
      ),
    );
  }
}
