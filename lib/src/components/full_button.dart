import 'package:flutter/material.dart';
import 'package:rmo_food/core/theme/common_theme.dart';

class FullButton extends StatelessWidget {
  final void Function() onPressed;
  final String btnName;
  final Color? txtColor;
  final double? height;
  final double? width;
  const FullButton(
      {super.key,
      required this.onPressed,
      required this.btnName,
      this.txtColor,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(width ?? double.infinity, height ?? 45),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2))),
            backgroundColor: primaryColor),
        onPressed: onPressed,
        child: Text(btnName,
            style: const TextStyle(color: Colors.white, fontFamily: "Lexend")));
  }
}
