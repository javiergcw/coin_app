import 'package:coin_flutter/screens/authentication/screens/Login.dart';
import 'package:coin_flutter/utils/res.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UISizedBox.gapH20,
        ElevatedButton(
          onPressed: () async {
            // Cerrar sesión del usuario actual
            await FirebaseAuth.instance.signOut();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Login()));
            // Navegar a la vista de inicio de sesión
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
