import 'package:flutter/material.dart';

class OnNavigateObserver extends NavigatorObserver {
  final Function(Route<dynamic>) onNavigateTo;

  OnNavigateObserver(this.onNavigateTo);

  @override
  void didPush(Route route, Route? previousRoute) {
    if (route.settings.name != null) {
      onNavigateTo(route);
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if (newRoute != null && newRoute.settings.name != null) {
      onNavigateTo(newRoute);
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    if (previousRoute != null && route.settings.name != null) {
      onNavigateTo(previousRoute);
    }
  }
}
