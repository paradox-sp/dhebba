import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class SigninPage extends NyStatefulWidget {
  static const path = '/signin';
  
  SigninPage({super.key}) : super(path, child: _SigninPageState());
}

class _SigninPageState extends NyState<SigninPage> {

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
        title: Text("Signin")
      ),
      body: SafeArea(
         child: Container(),
      ),
    );
  }
}
