part of 'routes_imports.dart';

class Routes {
  static String initial = "/";
  static String cafeDetail = "/cafeDetail";
  static String home = "/home";
  static String loginScreen = "/loginScreen";
  static String qrScanner = "/qrScanner";
}

Map<String, Function> getRoutes = {
  Routes.initial: (argument) => const SplashScreen(),
  Routes.cafeDetail: (argument) => const CafeDetailScreen(),
  Routes.home: (argument) => const HomeNavigationScreen(),
  Routes.loginScreen: (argument) => const LoginScreen(),
  Routes.qrScanner: (argument) => const QRscannerSreen()
};
