import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';

class RulesContainer extends StatelessWidget {
  const RulesContainer({
    required this.title,
    required this.subtitle,
    required this.icon,
    super.key,
  });

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: UIColors.redMain.withOpacity(0.4),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: UIColors.redMain,
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ),
        UISizedBox.gapW10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width - 150,
                child: Text(
                  title,
                  style: TitleContainerQuiz,
                )),
            UISizedBox.gapH4,
            SizedBox(
              width: MediaQuery.of(context).size.width - 150,
              child: Text(
                subtitle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
