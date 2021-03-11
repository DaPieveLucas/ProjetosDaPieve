import 'package:flutter/material.dart';
import 'package:rocket_guide_app/backend/backend.dart';
import 'package:rocket_guide_app/home_screen/rocket_list_tile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rocket Guide'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          RocketListTile(
            onTap: () {},
            rocket: _rocket,
          )
        ],
      ),
    );
  }
}
