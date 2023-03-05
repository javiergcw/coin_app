import 'package:coin_flutter/screens/profile/widgets/Items.dart';
import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';

class Name extends StatefulWidget {
  const Name({super.key});

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          "Javier Garcia",
          style: labelName,
        ),
        Text(
          "Usuario de prueba",
          style: labelTypeUser,
        ),
        UISizedBox.gapH30,
        Items()
      ],
    );
  }
}
