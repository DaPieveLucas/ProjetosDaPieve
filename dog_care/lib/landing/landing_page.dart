import 'package:flutter/material.dart';

import '../day_care/day_care_page.dart';
import '../home/home_page.dart';
import '../my_account/my_account_page.dart';
import '../widgets/bottom_bar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  static const List<Widget> _screens = [
    DayCarePage(),
    HomePage(),
    MyAccountPage(),
  ];

  int _selectedIndex = 0;

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomBar(
        index: _selectedIndex,
        onTapped: onTapped,
      ),
    );
  }
}
