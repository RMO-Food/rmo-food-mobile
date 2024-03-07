import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rmo_food/config/routes_imports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..addListener(() => setState(() {}))
          ..forward().whenComplete(
              () => Navigator.pushReplacementNamed(context, Routes.home));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
            child: SvgPicture.asset("assets/icons/splash.svg",
                color: Colors.red,
                height: controller.value * 200,
                width: controller.value * 200)));
  }
}
