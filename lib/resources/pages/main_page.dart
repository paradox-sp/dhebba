import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/user.dart';
import 'package:flutter_app/app/networking/user_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/bank_controller.dart';

class MainPage extends NyStatefulWidget<BankController> {
  static const path = '/main';

  MainPage({super.key}) : super(path, child: _MainPageState());
}

class _MainPageState extends NyState<MainPage> {
  bool isAmountVisible = false;
  // @override
  // init() async {

  // }

  /// Use boot if you need to load data before the [view] is rendered.
  // @override
  // boot() async {
  //
  // }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Dhebba')),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: NyPullToRefresh(
                data: (int iteration) async {
                  var response = await api<UserApiService>(
                      (request) => request.getUserDetail());
                  print("response: $response");
                  return [response];
                },
                child: (context, data) {
                  print("Data: $data");
                  if (data != null) {
                    return Container(
                      height: 600, // Adjust this value as needed
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      'public/assets/images/profile.jpg'),
                                ),
                                SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${data['fname']} ${data['lname']}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Available Amount: \Rs',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              isAmountVisible
                                  ? Text(
                                      ' ${data['amount']}',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    )
                                  : Text(
                                      ' ****',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                              IconButton(
                                icon: Icon(isAmountVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    isAmountVisible = !isAmountVisible;
                                  });
                                  // Hide/Unhide Amount functionality
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    // Return a placeholder or empty widget if data is null
                    return Center(
                      child: Text("No data available"),
                    );
                  }
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: widget.controller.onTapload,
                    child: Text('Load Amount'),
                  ),
                  ElevatedButton(
                    onPressed: widget.controller.onTapsend,
                    child: Text('Send Amount'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
