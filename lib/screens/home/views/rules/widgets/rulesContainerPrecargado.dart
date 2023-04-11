import 'package:CoinWrap/utils/res.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmerContainerRules(BuildContext context) {
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
    child: Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
          ),
        ),
        UISizedBox.gapW10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UISizedBox.gapH10,
            Container(
              height: 10,
              width: MediaQuery.of(context).size.width - 150,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            UISizedBox.gapH10,
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 150,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
