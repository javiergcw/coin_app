import 'package:CoinWrap/screens/bottomNavigator/bottomNavigator.dart';
import 'package:CoinWrap/utils/res.dart';
import 'package:flutter/material.dart';

class FinishShop extends StatelessWidget {
  const FinishShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Proceso de compra '),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: Image(
                  height: 300,
                  image: AssetImage(
                    Assets.rewardsIsometric,
                  ),
                ),
              ),
              UISizedBox.gapH10,
              const Text('Haz reclamado tu premio con éxito',
                  style: titleBlack, textAlign: TextAlign.justify),
              UISizedBox.gapH20,
              const Text(
                  'Felicidades, has realizado tu compra con éxito. Por favor, comunícate con tu maestro para coordinar la entrega de tu premio. Asegúrate de proporcionarle toda la información necesaria para que puedan ayudarte a recibir tu recompensa lo más pronto posible. ¡Disfruta de tu premio y sigue participando en nuestras actividades para ganar más puntos emocionantes!',
                  style: black15,
                  textAlign: TextAlign.justify),
              UISizedBox.gapH20,
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const CustomBottomNavigationBar()),
                      );
                    },
                    child: const Text("Continuar")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
