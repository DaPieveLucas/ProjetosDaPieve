import 'package:flutter/material.dart';

class DayCarePage extends StatelessWidget {
  const DayCarePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Day Care'),
      ),
      body: Center(
        child: Container(
          color: Colors.red,
          width: 25,
          height: 25,
        ),
      ),
    );
  }
}
