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
        child: NyPullToRefresh(
          data: (int iteration) async {
            var response = await api<UserApiService>(
                (request) => request.getUserstatement());
            print("response: $response");
            return [response];
            // .paginate(itemsPerPage: 2, page: iteration)
            // .toList();
          },
          child: (context, data) {
            print("Data: $data");
            // print("Data Length: ${data.length}");
            // print("Data len: ${data[0]}");
            // print("Data date: ${data[0]["transaction_datetime"]}");
            if (data.isNotEmpty) {
              return Container(
                //full screen height
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    int reversedIndex = data.length - 1 - index;
                    if (data.isNotEmpty &&
                        reversedIndex >= 0 &&
                        reversedIndex < data.length) {
                      return ListTile(
                        title:
                            Text(data[reversedIndex]["transaction_datetime"]),
                        subtitle: Text('''
          Transaction Amount: ${data[reversedIndex]["transaction_amount"]}
          Pickup Point: 
          Latitude - ${data[reversedIndex]["pickup_point_latitude"]}, 
          Longitude - ${data[reversedIndex]["pickup_point_longitude"]}
          Drop Point: 
          Latitude - ${data[reversedIndex]["drop_point_latitude"]}, 
          Longitude - ${data[reversedIndex]["drop_point_longitude"]}
          Distance Covered: ${data[reversedIndex]["distance_covered"]}
        '''),
                      );
                    }
                    return Center(
                      child: Text("No records available"),
                    );
                  },
                ),
              );
            } else {
              return Center(
                child: Text("No records available"),
              );
            }
          },
          // separatorBuilder: (BuildContext context, int index) {
          //   return Divider();
          // },
        ),
      ),
    );
  }
}
