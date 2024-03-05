import 'package:flutter/cupertino.dart';
import 'package:rmo_food/config/routes_imports.dart';

class GeneratedRoute {
  static Route<CupertinoPageRoute>? generatedRoute(RouteSettings settings) {
    return CupertinoPageRoute(
        settings: settings,
        builder: (context) => getRoutes[settings.name]!(settings.arguments));
  }
}
