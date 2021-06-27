import 'package:flutter/material.dart';
import 'package:pay_flow/modules/home/home_page.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';

import 'modules/login/login_page.dart';
import 'modules/splash/splash_page.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pay Flow',
        theme: ThemeData(primaryColor: AppColors.primary),
        home: LoginPage());
  }
}
