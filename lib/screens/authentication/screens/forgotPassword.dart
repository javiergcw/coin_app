import 'package:coin_flutter/screens/authentication/widgets/customButton.dart';
import 'package:coin_flutter/screens/authentication/widgets/customTextField.dart';
import 'package:coin_flutter/utils/res.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              UISizedBox.gapH20,
              CustomTextField(
                icon: Icons.mail,
                controller: email,
                hintText: 'Correo eletronico',
              ),
              UISizedBox.gapH20,
              customButton(
                onPressed: () {
                  resetPassword(email.text);
                  /*   _signUp(
                              email.text, password.text, firstn.text, context); */
                },
                label: 'Recuperar',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void resetPassword(String email) async {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  await _firebaseAuth.setLanguageCode('es');

  try {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
    debugPrint('Se envio con exito');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      // El usuario no existe
      throw 'Usuario no encontrado. Por favor verifique el correo electrónico y vuelva a intentarlo.';
    } else {
      // Error desconocido
      throw 'Ha ocurrido un error. Por favor inténtelo de nuevo más tarde.';
    }
  }
}
