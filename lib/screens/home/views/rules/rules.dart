import 'package:coin_flutter/providers/providerHelper/ProviderState.dart';
import 'package:coin_flutter/screens/home/views/rules/widgets/rulesContainer.dart';
import 'package:coin_flutter/screens/home/views/rules/widgets/rulesContainerPrecargado.dart';
import 'package:coin_flutter/utils/res.dart';
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
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              runSpacing: 10,
              children: [
                buildShimmerContainerRules(context),
                buildShimmerContainerRules(context),
                buildShimmerContainerRules(context),
              ],
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Reglas',
                style: titleBlack,
              ),
              UISizedBox.gapH20,
              Wrap(
                runSpacing: 10,
                children: const [
                  RulesContainer(
                    icon: Icons.shopping_bag_sharp,
                    title: 'Tienda',
                    subtitle: 'Este es un texto de ejemplo grande de tienda',
                  ),
                  RulesContainer(
                    icon: Icons.cookie_rounded,
                    title: 'Moneda',
                    subtitle: 'Este es un texto de ejemplo grande de Moneda',
                  ),
                  RulesContainer(
                    icon: Icons.home_repair_service_rounded,
                    title: 'Profesores',
                    subtitle:
                        'Este es un texto de ejemplo grande de profesores',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
