import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';

class BuyContainerInactive extends StatelessWidget {
  const BuyContainerInactive({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: UIColors.green.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
              color: UIColors.green,
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          UISizedBox.gapW14,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UISizedBox.gapH8,
              const Text(
                "Lapiz marca mongol",
              ),
              UISizedBox.gapH10,
              Row(
                children: [
                  Text(
                    "Estado: ",
                  ),
                  Text(
                    "Reclamado",
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Fecha del reclamo: ",
                  ),
                  Text(
                    "15/02/2023",
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
