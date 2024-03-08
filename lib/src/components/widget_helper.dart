import 'package:flutter/material.dart';

class AppWidgetHelper {
  static Widget decoratedContainer(
    BuildContext context, {
    required Widget child,
    double? height,
    double? width,
    Color? color,
    EdgeInsets? padding,
    EdgeInsets? margin,
  }) {
    return Container(
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
            color: color ?? Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(2),
            boxShadow: [
              BoxShadow(
                  color:
                      MediaQuery.platformBrightnessOf(context).name == "light"
                          ? Colors.grey.shade300
                          : Colors.black54,
                  blurRadius: 5)
            ]),
        width: width,
        height: height,
        child: child);
  }
}
