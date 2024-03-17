import 'package:flutter/material.dart';
import 'package:rmo_food/helper/back_button.dart';

class ConfirmOrder extends StatelessWidget {
  const ConfirmOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(leading: const AppBackButton()));
  }
}
