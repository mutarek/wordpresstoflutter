import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,
    ),
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  _State createState() => _State();
}

class _State extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
    );
  }
}
