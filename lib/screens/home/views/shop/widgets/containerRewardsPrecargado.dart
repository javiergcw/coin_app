import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmerContainer(BuildContext context) {
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
      width: MediaQuery.of(context).size.width / 2.2,
      height: MediaQuery.of(context).size.height / 3.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
    ),
  );
}
