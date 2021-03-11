import 'package:flutter/material.dart';
import 'package:rocket_guide_app/app/theme.dart';
import 'package:rocket_guide_app/home_screen/home_screen.dart';

class RocketGuideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      home: HomeScreen(),
    );
  }
}
