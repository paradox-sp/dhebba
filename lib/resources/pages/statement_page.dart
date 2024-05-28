import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../app/networking/user_api_service.dart';

class StatementPage extends NyStatefulWidget {
  static const path = '/statement';

  StatementPage({super.key}) : super(path, child: _StatementPageState());
}

class _StatementPageState extends NyState<StatementPage> {
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
      appBar: AppBar(title: Text("Statement")),
      body: SafeArea(
        child: NyPullToRefresh.separated(
          data: (int iteration) async {
            var response = await api<UserApiService>(
                (request) => request.getUserstatement());
            print("response: $response");
            return [response]
                .paginate(itemsPerPage: 1, page: iteration)
                .toList();
          },
          child: (BuildContext context, dynamic data) {
            print("Data: $data");
            print("Data Length: ${data.length}");
            print("Data len: ${data[0]}");
            print("Data date: ${data[0]["transaction_datetime"]}");
            return Container(
              height: 500, // specify the height of the container
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data[index]["transaction_datetime"]),
                    subtitle: Text('''
          Transaction Amount: ${data[index]["transaction_amount"]}
          Pickup Point: Latitude - ${data[index]["pickup_point_latitude"]}, Longitude - ${data[index]["pickup_point_longitude"]}
          Drop Point: Latitude - ${data[index]["drop_point_latitude"]}, Longitude - ${data[index]["drop_point_longitude"]}
          Distance Covered: ${data[index]["distance_covered"]}
        '''),
                  );
                },
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        ),
      ),
    );
  }
}
