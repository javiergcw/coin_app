import 'dart:io';

import 'package:coin_flutter/providers/providerHelper/ProviderState.dart';
import 'package:coin_flutter/screens/home/views/widgets/popUp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProviderState>(context, listen: false);

    return FutureBuilder<void>(
        future: model.getInfoUser(),
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
            children: model.infoUserWithId
                .map(
                  (item) => Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hola ${item['name']}"),
                          Row(
                            children: [
                              Text('Tus puntos: ${item['value']}'),
                              Container(
                                child: IconButton(
                                  onPressed: () {
                                    PopUp().MessageWhats(context);
                                  },
                                  icon: const Icon(
                                    Icons.question_mark,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        width: 80,
                        height: 80,
                        color: Colors.amber,
                      )
                    ],
                  ),
                )
                .toList(),
          );
        });
  }
}
     /* SizedBox(
      height: MediaQuery.of(context).size.width / 5.5,
      child: FutureBuilder(
        future: _providerState.getCoinId(),
        builder: (((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: ScrollController(keepScrollOffset: false),
              padding: EdgeInsets.zero,
              shrinkWrap: false,
              itemCount: snapshot.data?.length,
              itemBuilder: (((context, index) => Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Hola ${(snapshot.data?[index]['name']).toString()}"),
                          Text(
                            "${_providerState.getEmail}",
                          ),
                          Row(
                            children: [
                              Container(
                                color: Colors.amber,
                                child: Text(
                                  "Monedas: ${(snapshot.data?[index]['value']).toString()}",
                                ),
                              ),
                              Container(
                                color: Colors.amber,
                                child: IconButton(
                                    onPressed: () {
                                      PopUp().MessageWhats(context);
                                    },
                                    icon: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      Container(
                        width: 80,
                        height: 80,
                        color: Colors.amber,
                      )
                    ],
                  ))),
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
}*/