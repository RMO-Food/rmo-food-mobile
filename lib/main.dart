import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmo_food/bloc/authentication/authentication_cubit.dart';
import 'package:rmo_food/bloc/login/login_bloc.dart';
import 'package:rmo_food/config/routes_generate.dart';
import 'package:rmo_food/config/theme/theme_manager/theme_manager_cubit.dart';
import 'package:rmo_food/config/theme/theme_option/theme_option_cubit.dart';
import 'package:rmo_food/core/dependencies/shared_pref.dart';
import 'package:rmo_food/core/enums.dart';
import 'package:rmo_food/core/theme/dark_theme_data.dart';
import 'package:rmo_food/core/theme/light_theme_data.dart';
import 'package:rmo_food/locator/get_it.dart';
import 'package:rmo_food/service/http_executer.dart';
import 'package:rmo_food/service/i_server.dart';
import 'package:rmo_food/src/pages/services/cafe/bloc/cafe_cubit/cafe_cubit.dart';
import 'package:rmo_food/src/pages/services/menu/bloc/menu_item/menu_item_cubit.dart';
import 'package:rmo_food/src/pages/services/profile/bloc/profile_bloc.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await SharedPref.init();
    setUpLocator();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    runApp(EasyLocalization(
        saveLocale: true,
        supportedLocales: const [Locale('ne', 'NE'), Locale('en', 'US')],
        fallbackLocale: const Locale('en', 'US'),
        path: 'assets/language',
        child: const AppWrapper()));
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
          BlocProvider(create: (context) => AuthenticationCubit()),
          BlocProvider(create: (context) => CafeCubit()),
          BlocProvider(create: (context) => MenuItemCubit()),
          BlocProvider(create: (context) => ProfileBloc()),
          BlocProvider(
              create: (context) => ThemeOptionCubit()..getSavedOption()),
          BlocProvider(create: (context) => ThemeManagerCubit()),
        ],
        child: BlocBuilder<ThemeManagerCubit, ThemeMode>(
            builder: (context, state) {
          return MaterialApp(
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              navigatorKey: GeneratedRoute.navigatorKey,
              debugShowCheckedModeBanner: kDebugMode,
              themeMode: state,
              theme: LightThemeData.themeData(),
              darkTheme: DarkThemeData.themeData(),
              onGenerateRoute: GeneratedRoute.generatedRoute,
              builder: (BuildContext context, child) {
                Brightness platformBrightness = WidgetsBinding
                    .instance.platformDispatcher.platformBrightness;
                _checkInitalThemeMode(context, platformBrightness);
                _onSystemThemeChange(platformBrightness, context);
                return BlocListener<ThemeOptionCubit, ThemeOption>(
                    listener: (context, state) {
                      if (state == ThemeOption.light) {
                        BlocProvider.of<ThemeManagerCubit>(context)
                            .updateTheme(ThemeMode.light);
                      }
                      if (state == ThemeOption.dark) {
                        BlocProvider.of<ThemeManagerCubit>(context)
                            .updateTheme(ThemeMode.dark);
                      }
                      if (state == ThemeOption.system) {
                        if (MediaQuery.platformBrightnessOf(context).name ==
                            "light") {
                          BlocProvider.of<ThemeManagerCubit>(context)
                              .updateTheme(ThemeMode.light);
                        } else {
                          BlocProvider.of<ThemeManagerCubit>(context)
                              .updateTheme(ThemeMode.dark);
                        }
                      }
                    },
                    child: child!);
              });
        }));
  }

  void _onSystemThemeChange(
      Brightness platformBrightness, BuildContext context) {
    WidgetsBinding.instance.platformDispatcher.onPlatformBrightnessChanged =
        () {
      if (platformBrightness == Brightness.light) {
        BlocProvider.of<ThemeManagerCubit>(context)
            .updateTheme(ThemeMode.light);
      } else {
        BlocProvider.of<ThemeManagerCubit>(context).updateTheme(ThemeMode.dark);
      }
    };
  }

  void _checkInitalThemeMode(BuildContext context, Brightness mode) {
    switch (BlocProvider.of<ThemeOptionCubit>(context).state) {
      case ThemeOption.system:
        if (mode == Brightness.dark) {
          BlocProvider.of<ThemeManagerCubit>(context)
              .updateTheme(ThemeMode.dark);
        } else {
          BlocProvider.of<ThemeManagerCubit>(context)
              .updateTheme(ThemeMode.light);
        }
        break;
      case ThemeOption.dark:
        BlocProvider.of<ThemeManagerCubit>(context).updateTheme(ThemeMode.dark);
        break;
      case ThemeOption.light:
        BlocProvider.of<ThemeManagerCubit>(context)
            .updateTheme(ThemeMode.light);
        break;
      default:
    }
  }
}
