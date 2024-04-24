import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rmo_food/bloc/authentication/authentication_cubit.dart';
import 'package:rmo_food/src/pages/authentication/login.dart';
import 'package:rmo_food/src/pages/bottom_nav/bottom_nav.dart';
import 'package:rmo_food/src/pages/services/profile/bloc/profile_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  completeSplash(
      {required BuildContext context,
      required int seconds,
      bool? isAuthenticated = false}) async {
    await Future.delayed(Duration(seconds: seconds));
    // if (mounted) {
    //   Navigator.of(context).pushReplacement(PageRouteBuilder(
    //       pageBuilder: (context, animation, secondaryAnimation) =>
    //           const HomeNavigationScreen(),
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) =>
    //           FadeTransition(opacity: animation, child: child)));
    // }
    if (mounted) {
      Navigator.of(context).pushReplacement(PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              isAuthenticated!
                  ? const HomeNavigationScreen()
                  : const LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child)));
    }
  }

  @override
  void initState() {
    super.initState();
    completeSplash(context: context, seconds: 3);
    BlocProvider.of<AuthenticationCubit>(context).checkIsAuthenticated();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<AuthenticationCubit, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationAuthenticated) {
              BlocProvider.of<ProfileBloc>(context).add(FetchProfile());
              completeSplash(
                  context: context, seconds: 1, isAuthenticated: true);
            }
            if (state is AuthenticationUnAuthenticated) {
              completeSplash(context: context, seconds: 1);
            }
            return const _Splash();
          },
        ));
  }
}

class _Splash extends StatefulWidget {
  const _Splash({super.key});

  @override
  State<_Splash> createState() => _SplashState();
}

class _SplashState extends State<_Splash> with TickerProviderStateMixin {
  late final AnimationController controller;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..addListener(() => setState(() {}))
          ..forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SvgPicture.asset("assets/icons/splash.svg",
            color: Colors.red,
            height: controller.value * 200,
            width: controller.value * 200));
  }
}
