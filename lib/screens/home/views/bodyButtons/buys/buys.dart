import 'package:coin_flutter/providers/providerHelper/ProviderState.dart';
import 'package:coin_flutter/screens/home/views/bodyButtons/buys/widgets/BuysContainer.dart';
import 'package:coin_flutter/screens/home/views/bodyButtons/buys/widgets/BuysContainerInactive.dart';
import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Visibility(
            visible: model.buysWithId.isNotEmpty,
            replacement: Center(
                child: Column(
              children: const [
                Text('Tus compras'),
                SizedBox(
                  height: 50,
                ),
                Text('No hay elementos para mostrar.')
              ],
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tus compras',
                  style: titleBlack,
                ),
                BuyContainerActive(),
                BuyContainerInactive(),
                /*   Column(
                  children: model.buysWithId
                      .map(
                        (item) => SizedBox(
                          width: double.infinity,
                          height: 120,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: Image.network(item['image']),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(item['name'].toString(),
                                          style: const TextStyle(fontSize: 16)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                )
               */
              ],
            ),
          );
        });
  }

  /*  @override
  Widget build(BuildContext context) {
    ProviderState _providerState =
        Provider.of<ProviderState>(context, listen: false);
    return FutureBuilder(
      future: _providerState.getBuysId(),
      builder: (((context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tus compras'),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: snapshot.data?.length,
                  itemBuilder: ((context, index) => Column(
                        children: [
                          Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    child: Image.network(
                                        (snapshot.data?[index]['image'])
                                            .toString(),
                                        fit: BoxFit.contain),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Articulo: ${(snapshot.data?[index]['name']).toString()}",
                                      ),
                                      Text(
                                        "Estado: ${(snapshot.data?[index]['name']).toString()}",
                                      ),
                                    ],
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      ))),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      })),
    );
  }
 */
}
