import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:reduxsm/redux/actions.dart';
import 'package:reduxsm/redux/app_state.dart';
import 'package:reduxsm/redux/middleware.dart';
import 'package:reduxsm/redux/reducers.dart';
import 'package:reduxsm/view/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final Store<AppState> store = Store<AppState>(
      appStateReducer,
      initialState: AppState(),
      middleware: [
        settingsMiddleware,
        newsMiddleware,
        notesMiddleware,
      ],
  );

  store.dispatch(GetSettings());
  store.dispatch(GetNotes());
  store.dispatch(GetNews());

  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: StoreConnector<AppState, bool>(
        converter: (store) => store.state.darkTheme,
        builder: (context, darkTheme) {
          return MaterialApp(
            title: 'Flutter State Management',
            theme: darkTheme ? ThemeData.dark() : ThemeData.light(),
            home: MainScreen(title: 'Flutter State Management'),
          );
        }
      ),
    );
  }
}
