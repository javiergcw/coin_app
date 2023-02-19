import 'package:coin_flutter/providers/providerHelper/ProviderState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Buys extends StatelessWidget {
  const Buys({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderState _providerState =
        Provider.of<ProviderState>(context, listen: false);
    return SizedBox(
      height: MediaQuery.of(context).size.width / 5.5,
      child: FutureBuilder(
        future: _providerState.getBuysId(),
        builder: (((context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
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
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        })),
      ),
    );
  }
}
