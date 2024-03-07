import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rmo_food/config/routes_generate.dart';
import 'package:rmo_food/core/theme/dark_theme_data.dart';
import 'package:rmo_food/core/theme/light_theme_data.dart';

void main() {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light,
        theme: LightThemeData.themeData(),
        darkTheme: DarkThemeData.themeData(),
        onGenerateRoute: GeneratedRoute.generatedRoute);
  }
}
