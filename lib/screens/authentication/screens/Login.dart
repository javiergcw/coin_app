import 'package:coin_flutter/screens/authentication/screens/forgotPassword.dart';
import 'package:coin_flutter/screens/authentication/widgets/customButton.dart';
import 'package:coin_flutter/screens/authentication/widgets/customRichText.dart';
import 'package:coin_flutter/screens/authentication/widgets/customTextField.dart';
import 'package:coin_flutter/screens/bottomNavigator/bottomNavigator.dart';
import 'package:coin_flutter/screens/home/screens/homePage.dart';
import 'package:coin_flutter/screens/authentication/screens/Register.dart';
import 'package:coin_flutter/providers/providerHelper/ProviderState.dart';
import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();

    // If app starts in debug mode assign login and passord for testing, to avoid to write it
    setState(() {
      if (kDebugMode) {
        email.text = "jgarciacar20@gmail.com";
        password.text = "123456";
      }
    });
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F4FF),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                runSpacing: 25,
                children: [
                  const Center(
                    child: Image(
                      height: 200,
                      image: AssetImage(
                        Assets.loginIsometric,
                      ),
                    ),
                  ),
                  CustomTextField(
                    controller: email,
                    hintText: 'Correo electronico',
                    icon: Icons.mail,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    obscureText: true,
                    controller: password,
                    hintText: 'Contraseña',
                    icon: Icons.lock,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword()));
                    },
                    child: Row(
                      children: const [
                        Spacer(),
                        Text(
                          'Se te ha olvidado la contraseña?',
                          style: red,
                        ),
                      ],
                    ),
                  ),
                  customButton(
                    label: 'Ingresar',
                    onPressed: () {
                      _Login(email.text, password.text, context);
                    },
                  ),
                  customRichText(
                    fLabel: '¿Eres nuevo? ',
                    sLabel: 'registrate ahora',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProviderRegistration()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

void _Login(String email, String password, BuildContext context) async {
  ProviderState _providerState =
      Provider.of<ProviderState>(context, listen: false);
  try {
    if (await _providerState.LoginUser(email, password)) {
      await _providerState.getCoinId();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => CustomBottomNavigationBar()));
    } else {
      // ignore: use_build_context_synchronously
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: const Center(
              child: Text(
                'Contraseña incorrecta',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 10.0),
                const Center(
                  child: Text(
                    'Inténtalo nuevamente',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                const SizedBox(height: 10.0),
                const Divider(),
                TextButton(
                  child: const Text(
                    'Aceptar',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      );
    }
  } catch (e) {
    print(e);
  }
}
