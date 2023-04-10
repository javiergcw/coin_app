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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UISizedBox.gapH20,
                UISizedBox.gapH20,
                Center(
                  child: Image.asset(
                    Assets.psIsometric,
                    width: 280,
                  ),
                ),
                UISizedBox.gapH20,
                UISizedBox.gapH20,
                const Text(
                  '¿Haz olvidado tu contraseña?',
                  style: Black35,
                ),
                UISizedBox.gapH10,
                const Text(
                  'No te preocupes, suele ocurrir, ingrese la dirección asociada con su cuenta para recuperarla',
                  style: black15,
                ),
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
                  },
                  label: 'Recuperar',
                ),
              ],
            ),
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
