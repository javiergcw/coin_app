import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UISizedBox.gapH20,
        ElevatedButton(
          onPressed: () {
            // acción a realizar cuando se presiona el botón
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.red, // color de fondo del botón
            onPrimary: Colors.white, // color del texto del botón
          ),
          child: Text('Cerra sesión'),
        ),
      ],
    );
    ;
  }
}
