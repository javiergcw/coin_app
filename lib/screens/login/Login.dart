import 'package:coin_flutter/screens/bottomNavigator/bottomNavigator.dart';
import 'package:coin_flutter/screens/home/homePage.dart';
import 'package:coin_flutter/screens/login/Register.dart';
import 'package:coin_flutter/providers/Screens/Home/Home.dart';
import 'package:coin_flutter/providers/providerHelper/ProviderState.dart';
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
      backgroundColor: Color(0xffF1F4FF),
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          TextField(
            controller: email,
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: password,
          ),
          TextButton(
            onPressed: () {
              _Login(email.text, password.text, context);
            },
            child: const Text('ingresar'),
          ),
          TextButton(
            onPressed: () {
              _Login(email.text, password.text, context);
            },
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProviderRegistration()));
              },
              child: const Text('Registrarse'),
            ),
          )
        ],
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
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => CustomBottomNavigationBar()));
    }
  } catch (e) {
    print(e);
  }
}
