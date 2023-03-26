import 'package:coin_flutter/screens/authentication/widgets/customButton.dart';
import 'package:coin_flutter/screens/authentication/widgets/customTextField.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            CustomTextField(
              icon: Icons.mail,
              controller: email,
              hintText: 'Correo eletronico',
            ),
            customButton(
              onPressed: () {
                /*   _signUp(
                            email.text, password.text, firstn.text, context); */
              },
              label: 'Recuperar',
            ),
          ],
        ),
      ),
    );
  }
}
