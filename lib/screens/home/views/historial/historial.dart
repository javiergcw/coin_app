import 'package:CoinWrap/providers/providerHelper/ProviderState.dart';
import 'package:CoinWrap/screens/home/views/historial/widgets/BuysContainer.dart';
import 'package:CoinWrap/screens/home/views/historial/widgets/BuysContainerInactive.dart';
import 'package:CoinWrap/screens/home/views/historial/widgets/buildShimmerContainerHistorial.dart';
import 'package:CoinWrap/utils/res.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Buys extends StatelessWidget {
  const Buys({Key? key}) : super(key: key);

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

        model.buysWithId.sort((a, b) {
          if (a['status'] == "1" && b['status'] == "0") {
            return -1; // Si a tiene status 1 y b tiene status 0, a debe ir primero.
          } else if (a['status'] == "0" && b['status'] == "1") {
            return 1; // Si a tiene status 0 y b tiene status 1, b debe ir primero.
          } else {
            DateTime aDate = a['date'].toDate();
            DateTime bDate = b['date'].toDate();
            return bDate.compareTo(aDate); // Orden descendente de fechas.
          }
        });

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
            ),
          ),
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
                                date: DateFormat('dd/MM/yyyy').format(
                                  item['date'].toDate(),
                                ),
                                product: item['name'],
                                status: 'Sin reclamar',
                                image: 'assets/images/${item['image']}.png',
                              )
                            : BuyContainerActive(
                                date: DateFormat('dd/MM/yyyy').format(
                                  item['date'].toDate(),
                                ),
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
