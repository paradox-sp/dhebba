import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class SignoutPage extends NyStatefulWidget {
  static const path = '/signout';
  
  SignoutPage({super.key}) : super(path, child: _SignoutPageState());
}

class _SignoutPageState extends NyState<SignoutPage> {

  @override
  init() async {

  }
  
  /// Use boot if you need to load data before the [view] is rendered.
  // @override
  // boot() async {
  //
  // }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signout")
      ),
      body: SafeArea(
         child: Container(),
      ),
    );
  }
}
