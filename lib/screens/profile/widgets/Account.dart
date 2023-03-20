import 'package:coin_flutter/screens/home/views/widgets/line.dart';
import 'package:coin_flutter/screens/profile/widgets/SectionProfile.dart';
import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';

class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 15,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: [
        const Text(
          "Ajustes de cuenta",
          style: titleProfile,
        ),
        SectionProfile(
          icon: Icons.qr_code_rounded,
          subtitle: 'Ingresa tu Qr',
          title: 'Tu QR',
        ),
        Container(
          width: MediaQuery.of(context).size.height,
          height: 0.5,
          decoration: BoxDecoration(
            color: UIColors.gray,
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        SectionProfile(
          icon: Icons.line_axis_sharp,
          subtitle: 'Observa tus avances',
          title: 'Graficas',
        ),
      ],
    );
  }
}
