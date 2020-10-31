import 'package:flutter/material.dart';
import 'package:setstate/view/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter State Management',
      theme: ThemeData.dark(),
      home: MainScreen(title: 'Flutter State Management'),
    );
  }
}
