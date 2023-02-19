import 'package:coin_flutter/screens/login/Login.dart';
import 'package:coin_flutter/providers/providerHelper/ProviderState.dart';
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
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: TextField(
                            controller: firstn,
                            decoration: InputDecoration(
                              hintText: 'First Name',
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.blue)),
                              isDense: true, // Added this
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 20, 10, 10),
                            ),
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: TextField(
                            controller: lastn,
                            decoration: InputDecoration(
                              hintText: 'Last Name',
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.blue)),
                              isDense: true, // Added this
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 20, 10, 10),
                            ),
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: TextField(
                            controller: email,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.blue)),
                              isDense: true, // Added this
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 20, 10, 10),
                            ),
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: TextField(
                            controller: password,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.blue)),
                              isDense: true, // Added this
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 20, 10, 10),
                            ),
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                            onTap: () {
                              // Removes toast after 2 seconds
                              // RegisterUser();

                              _signUp(email.text, password.text, firstn.text,
                                  context);
                            },
                            child: Text('Sign-Up')),
                      ],
                    ),
                  )),
            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Login()));
          },
          child: RichText(
              text: TextSpan(
            text: 'New User?',
            style: TextStyle(fontSize: 15.0, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: ' Login Now',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0XFF4321F5)),
              ),
            ],
          )),
        ));
  }
}
