import 'package:flutter/material.dart';

extension TextTitle on Text {
  Text title({double? fontSize, Color? color, double? letterSpacing}) {
    return Text(data ?? "",
        style: TextStyle(
            fontSize: fontSize ?? 14,
            fontWeight: FontWeight.bold,
            color: color,
            letterSpacing: letterSpacing));
  }
}
