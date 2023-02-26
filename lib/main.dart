import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:yellowcat/data/middlewares/middlewares.dart';
import 'package:yellowcat/domain/models/app_state.dart';
import 'package:yellowcat/presentation/common/actions/actions.dart';
import 'package:yellowcat/presentation/common/app_scroll_behavior.dart';
import 'package:yellowcat/presentation/home_page.dart';
import 'package:yellowcat/presentation/reducers/app_state_reducer.dart';

void main() {
  final store = Store<AppState>(appStateReducer,
      initialState: AppState.loading(), middleware: [fetchProductsMiddleware]);
  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.store});
  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
          scrollBehavior: AppScrollBehavior(),
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: StoreBuilder<AppState>(
              onInitialBuild: (store) => store.dispatch(LoadProduct()),
              builder: (BuildContext context, Store<dynamic> vm) =>
                  const HomePage())),
    );
  }
}
