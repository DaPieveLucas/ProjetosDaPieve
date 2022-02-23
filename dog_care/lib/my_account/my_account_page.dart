import 'package:flutter/material.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('My Account'),
      ),
      body: Center(
        child: Container(
          color: Colors.blue,
          width: 25,
          height: 25,
        ),
      ),
    );
  }
}
