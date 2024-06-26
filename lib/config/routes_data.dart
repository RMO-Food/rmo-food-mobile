part of 'routes_imports.dart';

class Routes {
  static String initial = "/";
  static String cafeDetail = "/cafeDetail";
  static String confirmOrder = "/confirmOrder";
  static String home = "/home";
  static String helpAndSupport = "/helpAndSupport";
  static String loginScreen = "/loginScreen";
  static String qrScanner = "/qrScanner";
}

Map<String, Function> getRoutes = {
  Routes.initial: (argument) => const SplashScreen(),
  Routes.cafeDetail: (argument) =>
      CafeDetailScreen(cafeDatum: argument?['cafeDatum']),
  Routes.confirmOrder: (argument) => const ConfirmOrder(),
  Routes.home: (argument) => const HomeNavigationScreen(),
  Routes.helpAndSupport: (argument) => const HelpAndSupport(),
  Routes.loginScreen: (argument) => const LoginScreen(),
  Routes.qrScanner: (argument) => const QRscannerSreen()
};
