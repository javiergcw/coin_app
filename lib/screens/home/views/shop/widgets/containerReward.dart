import 'dart:ffi';

import 'package:CoinWrap/utils/res.dart';
import 'package:flutter/material.dart';

class ContainerReward extends StatelessWidget {
  const ContainerReward(
      {required this.colorPrimary,
      required this.colorSecondary,
      required this.image,
      required this.onTap,
      required this.name,
      required this.value,
      super.key});
  final String colorPrimary;
  final String colorSecondary;
  final String image;
  final String name;
  final String value;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10.0),
        ),
        width: MediaQuery.of(context).size.width / 2.2,
        height: MediaQuery.of(context).size.height / 3.9,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 6,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(int.parse(colorPrimary.substring(1, 7), radix: 16) +
                          0xFF000000), // UIColors.yellow,
                      Color(
                          int.parse(colorSecondary.substring(1, 7), radix: 16) +
                              0xFF000000), // UIColors.orange,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Image.asset(image, width: 130),
              ),
              UISizedBox.gapH10,
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: titleHistorial,
                      ),
                      Wrap(
                        spacing: 5,
                        children: const [
                          Text(
                            "Comprar ahora",
                            style: descriptionSubtitle,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 10,
                            color: UIColors.graySecondary,
                          )
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: UIColors.green,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Text(
                            value,
                            textAlign: TextAlign.end,
                            style: white15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
