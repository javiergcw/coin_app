import 'package:CoinWrap/utils/res.dart';
import 'package:flutter/material.dart';

class SectionProfile extends StatelessWidget {
  const SectionProfile(
      {required this.title,
      required this.subtitle,
      required this.icon,
      super.key});

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: Icon(
                icon,
                color: UIColors.redMain,
                size: 20,
              ),
            ),
            UISizedBox.gapW14,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: subtitleBlack,
                ),
                Text(
                  subtitle,
                  style: descriptionSubtitle14,
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
            )
          ],
        ),
      ],
    );
  }
}
