import 'package:coin_flutter/screens/profile/widgets/SectionProfile.dart';
import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';

class GeneralInfo extends StatelessWidget {
  const GeneralInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 15,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: [
        const Text(
          "Información general",
          style: titleProfile,
        ),
        const SectionProfile(
          icon: Icons.format_align_center,
          subtitle: 'Escribe tus dudas/problemas',
          title: 'Contactanos',
        ),
        Container(
          width: MediaQuery.of(context).size.height,
          height: 0.5,
          decoration: BoxDecoration(
            color: UIColors.gray,
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        const SectionProfile(
          icon: Icons.terminal_sharp,
          subtitle: 'Politicas para participar en el app',
          title: 'Terminos y condiciones',
        ),
        Container(
          width: MediaQuery.of(context).size.height,
          height: 0.5,
          decoration: BoxDecoration(
            color: UIColors.gray,
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        const SectionProfile(
          icon: Icons.cookie,
          subtitle: 'Coin wrap',
          title: 'Conoce nuestra página web',
        ),
      ],
    );
    ;
  }
}
