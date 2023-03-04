import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';

class ContainerReward extends StatelessWidget {
  const ContainerReward({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            UIColors.yellow,
            UIColors.orange,
          ],
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
