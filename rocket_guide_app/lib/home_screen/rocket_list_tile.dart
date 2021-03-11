import 'package:flutter/material.dart';
import 'package:rocket_guide_app/backend/backend.dart';

class RocketListTile extends StatelessWidget {
  RocketListTile({
    Key key,
    @required this.onTap,
    @required this.rocket,
  })  : assert(rocket != null),
        super(key: key);

  final VoidCallback onTap;
  final Rocket rocket;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(rocket.name),
      subtitle: Text(rocket.description),
    );
  }
}
