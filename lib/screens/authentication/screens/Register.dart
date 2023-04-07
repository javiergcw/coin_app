import 'package:coin_flutter/screens/authentication/screens/Login.dart';
import 'package:coin_flutter/providers/providerHelper/ProviderState.dart';
import 'package:coin_flutter/screens/authentication/widgets/customButton.dart';
import 'package:coin_flutter/screens/authentication/widgets/customTextField.dart';
import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderRegistration extends StatefulWidget {
  @override
  _ProviderRegistrationState createState() => _ProviderRegistrationState();
}

class _ProviderRegistrationState extends State<ProviderRegistration> {
  final TextEditingController firstn = TextEditingController();
  final TextEditingController lastn = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  void _signUp(
      String email, String password, String name, BuildContext context) async {
    ProviderState _providerState =
        Provider.of<ProviderState>(context, listen: false);
    try {
      if (await _providerState.signUpUser(email, password, name)) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F4FF),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
              child: SingleChildScrollView(
                child: Wrap(
                  runSpacing: 20,
                  children: [
                    Center(
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
                        child: const Image(
                          image: AssetImage(
                            Assets.passwordIsometric,
                          ),
                          height: 200.0,
                        ),
                      ),
                    ),
                    CustomTextField(
                      icon: Icons.person,
                      controller: firstn,
                      hintText: 'Nombre',
                    ),
                    CustomTextField(
                      icon: Icons.account_circle_rounded,
                      controller: lastn,
                      hintText: 'Apellido',
                    ),
                    CustomTextField(
                      icon: Icons.mail,
                      controller: email,
                      hintText: 'Correo eletronico',
                    ),
                    CustomTextField(
                      icon: Icons.lock,
                      controller: password,
                      hintText: 'Contraseña',
                      obscureText: true,
                    ),
                    customButton(
                      onPressed: () {
                        _signUp(
                            email.text, password.text, firstn.text, context);
                      },
                      label: 'Registrarsé',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
