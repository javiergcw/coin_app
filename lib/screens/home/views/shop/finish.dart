import 'package:coin_flutter/screens/bottomNavigator/bottomNavigator.dart';
import 'package:flutter/material.dart';

class FinishShop extends StatelessWidget {
  const FinishShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text('Felicidades haz realizado tu compra con éxito'),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomBottomNavigationBar()),
                  );
                },
                child: const Text("Continuar"))
          ],
        ),
      ),
    );
  }
}
