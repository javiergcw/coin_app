import 'package:coin_flutter/providers/providerHelper/ProviderState.dart';
import 'package:coin_flutter/screens/home/views/historial/widgets/BuysContainer.dart';
import 'package:coin_flutter/screens/home/views/historial/widgets/BuysContainerInactive.dart';
import 'package:coin_flutter/screens/home/views/historial/widgets/buildShimmerContainerHistorial.dart';
import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Buys extends StatelessWidget {
  const Buys({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProviderState>(context, listen: false);

    return FutureBuilder<void>(
      future: model.getBuysWithId(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Error al obtener datos de Firestore'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Wrap(
                    runSpacing: 10,
                    children: [
                      buildShimmerContainerHistorial(context),
                      buildShimmerContainerHistorial(context),
                      buildShimmerContainerHistorial(context),
                      buildShimmerContainerHistorial(context),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        return Visibility(
          visible: model.buysWithId.isNotEmpty,
          replacement: Center(
              child: Column(
            children: const [
              Text('Compras'),
              SizedBox(
                height: 50,
              ),
              Text('No hay elementos para mostrar.')
            ],
          )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tus compras',
                  style: titleBlack,
                ),
                UISizedBox.gapH10,
                Wrap(
                  runSpacing: 10,
                  children: model.buysWithId
                      .map(
                        (item) => item['status'] == "0"
                            ? BuyContainerInactive(
                                date: DateFormat('dd/MM/yyyy')
                                    .format(item['date'].toDate())
                                    .toString(),
                                product: item['name'],
                                status: 'Sin reclamar',
                                image: 'assets/images/${item['image']}.png',
                              )
                            : BuyContainerActive(
                                date: DateFormat('dd/MM/yyyy')
                                    .format(item['date'].toDate())
                                    .toString(),
                                product: item['name'],
                                status: 'Reclamado',
                                image: 'assets/images/${item['image']}.png',
                              ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
