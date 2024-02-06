part of '../../app_extension.dart';

class MyAppRouterObserver extends AutoRouterObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('${previousRoute?.settings.name ?? ''}➡️${route.settings.name}');
    // MyAppX.analytics.setCurrentScreenName(route.settings.name ?? '');
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('${previousRoute?.settings.name ?? ''}⬅️${route.settings.name}');
    // MyAppX.analytics.setCurrentScreenName(route.settings.name ?? '');
    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('${previousRoute?.settings.name ?? ''}⬅️${route.settings.name}');
    // MyAppX.analytics.setCurrentScreenName(route.settings.name ?? '');
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    log('${oldRoute?.settings.name}➡️${newRoute?.settings.name}');
    // MyAppX.analytics.setCurrentScreenName(newRoute?.settings.name ?? '');
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
