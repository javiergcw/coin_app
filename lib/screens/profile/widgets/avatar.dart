import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';

class Avatar extends StatefulWidget {
  const Avatar({super.key});

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UISizedBox.gapH10,
        Container(
          width: 200,
          height: 100,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
        ),
        UISizedBox.gapH10,
        const Text(
          'Javier Garcia',
          style: subtitleBlack,
        ),
        UISizedBox.gapH6,
        Container(
          width: MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(
            color: UIColors.redWLIGHT,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: UIColors.redW,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
                UISizedBox.gapW10,
                const Text(
                  'Estudiante',
                  style: reqQ14,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
