import 'package:flutter/cupertino.dart';
import 'package:rmo_food/config/routes_imports.dart';

class GeneratedRoute {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Route<CupertinoPageRoute>? generatedRoute(RouteSettings settings) {
    return CupertinoPageRoute(
        settings: settings,
        builder: (context) => getRoutes[settings.name]!(settings.arguments));
  }
}
