import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AppusagePage extends NyStatefulWidget {
  static const path = '/appusage';

  AppusagePage({super.key}) : super(path, child: _AppusagePageState());
}

class _AppusagePageState extends NyState<AppusagePage> {
  int? launchCount;
  DateTime? firstLaunchDate;
  int? totalDaysSinceFirstLaunch;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    launchCount = await Nylo.appLaunchCount();
    firstLaunchDate = await Nylo.appFirstLaunchDate();
    totalDaysSinceFirstLaunch = await Nylo.appTotalDaysSinceFirstLaunch();
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
        title: Text('App Usage'),
      ),
      body: FutureBuilder<void>(
        future: init(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Launch Count: $launchCount',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'First Launch Date: ${firstLaunchDate.toString()}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Total Days Since First Launch: $totalDaysSinceFirstLaunch',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
