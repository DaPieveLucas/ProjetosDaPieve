import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({required this.index, required this.onTapped, Key? key})
      : super(key: key);

  final int index;
  final Function(int) onTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.adb_rounded),
          label: 'Day Care',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.house),
          label: 'Home Page',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'My Account',
        ),
      ],
      currentIndex: index,
      selectedItemColor: Colors.amber,
      onTap: onTapped,
    );
  }
}
