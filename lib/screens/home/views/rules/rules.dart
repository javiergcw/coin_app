import 'package:coin_flutter/providers/providerHelper/ProviderState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Rules extends StatelessWidget {
  const Rules({super.key});
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProviderState>(context, listen: false);

    return FutureBuilder<void>(
      future: model.getRewards(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Error al obtener datos de Firestore'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Column(
          children: [
            Container(
              width: double.infinity,
              height: 40,
              color: Colors.amber,
            ),
            Container(
              width: double.infinity,
              height: 40,
              color: Colors.amber,
            ),
          ],
        );
      },
    );
  }
}
