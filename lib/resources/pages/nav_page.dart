import 'package:flutter/material.dart';
import 'package:flutter_app/resources/pages/account_page.dart';
import 'package:flutter_app/resources/pages/about_page.dart';
import 'package:flutter_app/resources/pages/main_page.dart';
import 'package:flutter_app/resources/pages/map_page.dart';
import 'package:flutter_app/resources/pages/nfc_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

class NavPage extends NyStatefulWidget {
  static const path = '/nav';

  NavPage({super.key}) : super(path, child: _NavPageState());
}

class _NavPageState extends NyState<NavPage> {
  int _currentIndex = 0;
  // @override
  // init() async {}

  // final List<Widget> _pages = [
  //   // routeTo(HomePage.path, navigationType: NavigationType.pushReplace),
  //   HomePage(),
  //   MapPage(),
  //   NfcPage(),
  //   AccountPage(),
  //   SigninPage(),
  // ];

  /// Use boot if you need to load data before the [view] is rendered.
  // @override
  // boot() async {
  //
  // }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('My App'),
      // ),
      body: _createPage(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
            ),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.nfc_rounded,
              size: 35,
            ),
            label: 'Pay',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
      ),
    );
  }

  Widget _createPage(int index) {
    switch (index) {
      case 0:
        return MainPage(); // replace with your page constructors
      case 1:
        return MapPage();
      case 2:
        return NfcPage();
      case 3:
        return AccountPage();
      case 4:
        return AboutPage();
      default:
        throw Exception('Invalid page index: $index');
    }
  }
}
