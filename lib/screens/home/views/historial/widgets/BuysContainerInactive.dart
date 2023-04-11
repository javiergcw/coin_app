import 'package:CoinWrap/utils/res.dart';
import 'package:flutter/material.dart';

class BuyContainerInactive extends StatelessWidget {
  const BuyContainerInactive(
      {required this.product,
      required this.date,
      required this.status,
      required this.image,
      super.key});

  final String product;
  final String date;
  final String status;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: UIColors.graySix,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: UIColors.grayFive,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Opacity(
                opacity: 0.5,
                child: Image.asset(image),
              ),
            ),
          ),
          UISizedBox.gapW14,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UISizedBox.gapH14,
              Text(product, style: titleHistorialInactive),
              UISizedBox.gapH10,
              Row(
                children: [
                  const Text("Estado: ", style: descriptionInactive),
                  Text(status, style: descriptionInactive),
                ],
              ),
              Row(
                children: [
                  const Text("Fecha del reclamo: ", style: descriptionInactive),
                  Text(date, style: descriptionInactive),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
