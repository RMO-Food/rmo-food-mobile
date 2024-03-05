part of 'routes_imports.dart';

class Routes {
  static String initial = "/";
}

Map<String, Function> getRoutes = {
  Routes.initial: (argument) => const SplashScreen()
};
