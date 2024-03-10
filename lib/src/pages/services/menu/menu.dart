import 'package:flutter/material.dart';
import 'package:rmo_food/core/theme/common_theme.dart';
import 'package:rmo_food/helper/custom_appbar.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(
            title: Text("Menu",
                style: TextStyle(fontSize: 18, color: primaryColor),
                textAlign: TextAlign.center)));
  }
}
