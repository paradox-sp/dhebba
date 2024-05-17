import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class StatementPage extends NyStatefulWidget {
  static const path = '/statement';
  
  StatementPage({super.key}) : super(path, child: _StatementPageState());
}

class _StatementPageState extends NyState<StatementPage> {

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
        title: Text("Statement")
      ),
      body: SafeArea(
         child: Container(),
      ),
    );
  }
}
