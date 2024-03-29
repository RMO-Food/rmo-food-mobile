part of 'routes_imports.dart';

class Routes {
  static String initial = "/";
  static String cafeDetail = "/cafeDetail";
  static String confirmOrder = "/confirmOrder";
  static String home = "/home";
  static String loginScreen = "/loginScreen";
  static String qrScanner = "/qrScanner";
}

Map<String, Function> getRoutes = {
  Routes.initial: (argument) => const SplashScreen(),
  Routes.cafeDetail: (argument) => const CafeDetailScreen(),
  Routes.confirmOrder: (argument) => const ConfirmOrder(),
  Routes.home: (argument) => const HomeNavigationScreen(),
  Routes.loginScreen: (argument) => const LoginScreen(),
  Routes.qrScanner: (argument) => QRscannerSreen()
};
