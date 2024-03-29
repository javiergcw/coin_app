// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:CoinWrap/providers/providerHelper/ProviderState.dart';
import 'package:CoinWrap/screens/authentication/screens/Login.dart';
import 'package:CoinWrap/utils/res.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProviderState(),
        ),
      ],
      child: const MyProviderApp(),
    ),
  );
}

class MyProviderApp extends StatelessWidget {
  const MyProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: UIColors.redMain,
      ),
      home: /*  QRScanner() */ Login(),
    );
  }
}
