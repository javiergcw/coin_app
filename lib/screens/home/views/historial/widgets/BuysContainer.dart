import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';

class BuyContainerActive extends StatelessWidget {
  const BuyContainerActive(
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
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(image, width: 130),
            ),
          ),
          UISizedBox.gapW14,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UISizedBox.gapH14,
              Text(
                product,
                style: titleHistorial,
              ),
              UISizedBox.gapH10,
              Row(
                children: [
                  const Text("Estado: ", style: descriptionSubtitle),
                  Text(status, style: descriptionHistorial),
                ],
              ),
              Row(
                children: [
                  const Text("Fecha del reclamo: ", style: descriptionSubtitle),
                  Text(date, style: descriptionHistorial),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
