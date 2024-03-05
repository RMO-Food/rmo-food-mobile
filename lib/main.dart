import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rmo_food/config/routes_generate.dart';

void main() {
  runZonedGuarded(() {
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
    return const MaterialApp(onGenerateRoute: GeneratedRoute.generatedRoute);
  }
}
