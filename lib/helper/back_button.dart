import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  final double? size;
  final Function()? onPressed;
  const AppBackButton({super.key, this.size, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        padding: EdgeInsets.zero,
        onPressed: onPressed ??
            () {
              FocusScope.of(context).unfocus();
              // to stop the issue when keyboard and screen pops at the same time.
              Future.delayed(const Duration(milliseconds: 100))
                  .whenComplete(() => Navigator.pop(context));
            },
        icon: Icon(Icons.arrow_back_ios, size: size ?? 20));
  }
}
