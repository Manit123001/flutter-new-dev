import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clean_architecture/core/navigation/navigation.dart';
import 'package:flutter_mvvm_clean_architecture/core/navigation/on_navigation_observer.dart';
import 'package:flutter_mvvm_clean_architecture/route/route_management.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  Future<dynamic> initialData() async {
    await Future.delayed(Duration(milliseconds: 1000), () {
      // Do something
      debugPrint('Step 2, load some thing success');
    });

    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initialData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          debugPrint('Step 3, build widget: ${snapshot.data}');
          // Build the widget with data.
          return NewApp();
        } else {
          // We can show the loading view until the data comes back.
          debugPrint('Step 1, build loading widget');
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class NewApp extends StatelessWidget {
  const NewApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: Routes.homePage,
      onGenerateRoute: RouteGenerator.getRoute,
      navigatorKey: Navigation.navigatorKey,
      navigatorObservers: [
        OnNavigateObserver(
          (route) => print(route.settings.name),
        ),
      ],
    );
  }
}
