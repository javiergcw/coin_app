import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height / 2.4,
      height: 1,
      decoration: BoxDecoration(
        color: UIColors.gray,
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
