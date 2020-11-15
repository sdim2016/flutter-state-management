import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:reduxsm/redux/app_state.dart';
import 'package:reduxsm/view/main_screen.dart';

void main() {
  //final Store<AppState> store = Store<AppState>();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter State Management',
      theme: ThemeData.light(),
      home: MainScreen(title: 'Flutter State Management'),
    );
  }
}
