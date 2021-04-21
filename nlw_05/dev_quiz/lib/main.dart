import 'package:flutter/material.dart';

import 'core/app_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DevQuiz',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: AppWidget(),
    );
  }
}
