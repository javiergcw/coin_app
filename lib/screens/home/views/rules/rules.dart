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
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              runSpacing: 15,
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
                runSpacing: 15,
                children: const [
                  RulesContainer(
                    icon: Icons.wb_incandescent_sharp,
                    title: '¡Gana puntos mientras aprendes!',
                    subtitle:
                        'Te motiva a participar en actividades y quizes relacionadas a tu clase',
                  ),
                  RulesContainer(
                    icon: Icons.sentiment_very_satisfied_sharp,
                    title: '¡Aprender es más divertido!',
                    subtitle:
                        'Tus profesores te darán puntos cada vez que completes actividades y quizes en clase.',
                  ),
                  RulesContainer(
                    icon: Icons.monetization_on,
                    title: 'Canjea tus puntos y gana',
                    subtitle:
                        'acumula puntos por tus actividades y quizes, y canjéalos por productos exclusivos en nuestra tienda virtual.',
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
