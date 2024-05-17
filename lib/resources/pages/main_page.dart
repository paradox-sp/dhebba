import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class MainPage extends NyStatefulWidget {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      AssetImage('public/assets/images/profile.jpg'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
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
                      ' 500',
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
                icon: Icon(
                    isAmountVisible ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    isAmountVisible = !isAmountVisible;
                  });
                  // Hide/Unhide Amount functionality
                },
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Load Amount functionality
                },
                child: Text('Load Amount'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Send Amount functionality
                },
                child: Text('Send Amount'),
              ),
            ],
          ),
          SizedBox(height: 16),
          // Add any additional widgets you like here
        ],
      ),
    );
  }
}
