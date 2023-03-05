import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';

class ContainerQuiz extends StatefulWidget {
  const ContainerQuiz({super.key});

  @override
  State<ContainerQuiz> createState() => _ContainerQuizState();
}

class _ContainerQuizState extends State<ContainerQuiz> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [
                  UIColors.redQ,
                  UIColors.redW,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          UISizedBox.gapW10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UISizedBox.gapH14,
              const Text("Nombre del quiz", style: TitleContainerQuiz),
              UISizedBox.gapH20,
              Row(
                children: const [
                  Text("Porcentaje: ", style: subtitleContainerQuiz),
                  Text(
                    "15%",
                    style: subtitleLabelContainerQuiz,
                  ),
                ],
              ),
              Row(
                children: const [
                  Text("Intentos: ", style: subtitleContainerQuiz),
                  Text(
                    "1/1",
                    style: subtitleLabelContainerQuiz,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
