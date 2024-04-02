import 'package:flutter/material.dart';
import 'package:rmo_food/core/theme/common_theme.dart';

class ScreenLoadingIndicator extends StatelessWidget {
  const ScreenLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) =>
      const Center(child: CircularProgressIndicator(color: primaryColor));
}
