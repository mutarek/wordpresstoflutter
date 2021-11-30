import 'package:flutter/material.dart';
import 'home.dart';
import 'showpost.dart';
import 'widgets/customDrawer.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
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
      body: ShowPost(),
    );
  }
}
