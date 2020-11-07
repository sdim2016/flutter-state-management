import 'package:flutter/material.dart';
import 'package:getxsm/view/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter State Management',
      theme: ThemeData.light(),
      home: MainScreen(title: 'Flutter State Management'),
    );
  }
}
