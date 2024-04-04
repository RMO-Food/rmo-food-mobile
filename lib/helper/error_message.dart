import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final void Function() onPressed;
  final String errorMessage;
  const ErrorMessage(
      {super.key, required this.errorMessage, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text("Refresh"),
            IconButton(onPressed: onPressed, icon: const Icon(Icons.refresh))
          ]),
          Text(errorMessage)
        ]);
  }
}
