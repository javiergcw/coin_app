import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmerContainerHistorial(BuildContext context) {
  return Shimmer(
    gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Colors.grey[300]!,
        Colors.grey[100]!,
        Colors.grey[300]!,
      ],
      stops: [0.45, 0.5, 0.55],
    ),
    period: Duration(milliseconds: 500),
    child: Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
    ),
  );
}
