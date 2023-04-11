import 'package:CoinWrap/screens/authentication/screens/Login.dart';
import 'package:CoinWrap/providers/providerHelper/ProviderState.dart';
import 'package:CoinWrap/screens/authentication/widgets/customButton.dart';
import 'package:CoinWrap/screens/authentication/widgets/customTextField.dart';
import 'package:CoinWrap/utils/res.dart';
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Wrap(
                  runSpacing: 20,
                  children: [
                    const Image(
                      image: AssetImage(
                        Assets.registerIsometric,
                      ),
                      height: 260.0,
                    ),
                    const Text(
                      '¿Eres nuevo?',
                      style: Black35,
                    ),
                    UISizedBox.gapH10,
                    const Text(
                      'Te invitamos a registrarte en CoinWrap',
                      style: black15,
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
            ],
          ),
        ),
      ),
    );
  }
}
