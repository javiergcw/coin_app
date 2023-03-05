import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';

class BuyContainerActive extends StatelessWidget {
  const BuyContainerActive({super.key});

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
                  offset: const Offset(0, 0), // changes position of shadow
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
              UISizedBox.gapH14,
              const Text(
                "Lapiz marca mongol",
                style: titleHistorial,
              ),
              UISizedBox.gapH10,
              Row(
                children: [
                  const Text("Estado: ", style: descriptionSubtitle),
                  Text("Reclamado", style: descriptionHistorial),
                ],
              ),
              Row(
                children: [
                  const Text("Fecha del reclamo: ", style: descriptionSubtitle),
                  Text("15/02/2023", style: descriptionHistorial),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
