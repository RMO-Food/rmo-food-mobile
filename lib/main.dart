import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmo_food/bloc/authentication/authentication_cubit.dart';
import 'package:rmo_food/bloc/login/login_bloc.dart';
import 'package:rmo_food/config/routes_generate.dart';
import 'package:rmo_food/core/dependencies/shared_pref.dart';
import 'package:rmo_food/core/theme/dark_theme_data.dart';
import 'package:rmo_food/core/theme/light_theme_data.dart';
import 'package:rmo_food/locator/get_it.dart';
import 'package:rmo_food/service/http_executer.dart';
import 'package:rmo_food/service/i_server.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SharedPref.init();
    setUpLocator();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    runApp(const AppWrapper());
  }, (error, stack) {
    log(error.toString());
  });
}

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  void bootServer() {
    if (kDebugMode) {
      HttpExecuter.init(ITestServerImpl());
    } else {
      HttpExecuter.init(ITestServerImpl());
      // HttpExecuter.init(ILiveServerImpl());
    }
  }

  @override
  void initState() {
    bootServer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginBloc()),
          BlocProvider(create: (context) => AuthenticationCubit())
        ],
        child: MaterialApp(
            navigatorKey: GeneratedRoute.navigatorKey,
            debugShowCheckedModeBanner: kDebugMode,
            themeMode: ThemeMode.system,
            theme: LightThemeData.themeData(),
            darkTheme: DarkThemeData.themeData(),
            onGenerateRoute: GeneratedRoute.generatedRoute));
  }
}
