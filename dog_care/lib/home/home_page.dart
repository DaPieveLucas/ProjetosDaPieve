import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog Care'),
      ),
      body: Center(
        child: Container(
          color: Colors.amber,
          height: 25,
          width: 25,
        ),
      ),
    );
  }
}
