import 'package:flutter/material.dart';
import 'package:rmo_food/helper/back_button.dart';

class QRscannerSreen extends StatelessWidget {
  const QRscannerSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text("Qr"),
      ),
    );
  }
}
