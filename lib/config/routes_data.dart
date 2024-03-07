part of 'routes_imports.dart';

class Routes {
  static String initial = "/";
  static String loginScreen = "/loginScreen";
  static String home = "/home";
}

Map<String, Function> getRoutes = {
  Routes.initial: (argument) => const SplashScreen(),
  Routes.loginScreen: (argument) => const LoginScreen(),
  Routes.home: (argument) => const HomeNavigationScreen()
};
