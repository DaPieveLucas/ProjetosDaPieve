import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MainGame(),
    );
  }
}

class MainGame extends StatefulWidget {
  const MainGame({
    Key? key,
  }) : super(key: key);

  @override
  State<MainGame> createState() => _MainGameState();
}

class _MainGameState extends State<MainGame> {
  final Color? _transparent = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.1, 0.5, 0.7, 0.9],
          colors: <Color>[
            Colors.red[500]!,
            Colors.yellow[600]!,
            Colors.yellow[400]!,
            Colors.yellow[200]!,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: _transparent,
        appBar: AppBar(
          backgroundColor: _transparent,
          shadowColor: _transparent,
          centerTitle: true,
          title: Text(
            'JokenPo Game',
          ),
        ),
        body: const SizedBox(),
      ),
    );
  }
}
