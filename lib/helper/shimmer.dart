import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      for (int i = 0; i < 10; i++) ...{
        Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child:
                Container(height: 20, width: 80, color: Colors.grey.shade300))
      }
    ]);
  }
}
