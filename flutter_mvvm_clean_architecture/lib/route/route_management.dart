import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clean_architecture/presentation/about/about_page.dart';
import 'package:flutter_mvvm_clean_architecture/presentation/home/home_page.dart';
import 'package:flutter_mvvm_clean_architecture/presentation/home/home_view_model.dart';
import 'package:flutter_mvvm_clean_architecture/res/app_string.dart';
import 'package:provider/provider.dart';

class Routes {
  static const String homePage = "/";
  static const String aboutPage = "/about";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => HomeViewModel(),
            child: const Home(),
          ),
          settings: routeSettings,
        );
      case Routes.aboutPage:
        return MaterialPageRoute(
          builder: (_) => AboutPage(),
          settings: routeSettings,
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.unDefinedRoute),
        ),
        body: Container(),
      );
    });
  }
}
