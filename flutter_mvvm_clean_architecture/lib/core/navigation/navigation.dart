import 'package:flutter/material.dart';

class Navigation {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState? get currentState {
    return navigatorKey.currentState;
  }

  Future<dynamic> navigateTo(String routeName, {Map<String, dynamic>? arguments}) async {
    Future.delayed(Duration.zero, () async {
      return await navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
    });
  }

  Future<dynamic> navigateReplaceTo(String routeName, {Map<String, dynamic>? arguments}) async {
    Future.delayed(Duration.zero, () async {
      return await navigatorKey.currentState?.pushReplacementNamed(routeName, arguments: arguments);
    });
  }

  void goBack([Map<String, dynamic>? arguments = const {}]) {
    navigatorKey.currentState?.pop(arguments);
  }

  void goBackHome() async {
    navigatorKey.currentState?.popUntil((r) => r.isFirst);
  }
}
