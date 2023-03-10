import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';

class ContainerReward extends StatelessWidget {
  const ContainerReward(
      {required this.colorPrimary,
      required this.colorSecondary,
      required this.image,
      super.key});
  final String colorPrimary;
  final String colorSecondary;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.4,
      height: MediaQuery.of(context).size.height / 4.5,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(int.parse(colorPrimary.substring(1, 7), radix: 16) +
                0xFF000000), // UIColors.yellow,
            Color(int.parse(colorSecondary.substring(1, 7), radix: 16) +
                0xFF000000), // UIColors.orange,
          ],
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [Image.asset(image)],
      ),
    );
  }
}
