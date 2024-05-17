import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class NfcPage extends NyStatefulWidget {
  static const path = '/nfc';

  NfcPage({super.key}) : super(path, child: _NfcPageState());
}

class _NfcPageState extends NyState<NfcPage> {
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
      appBar: AppBar(title: Center(child: Text("Nfc"))),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
