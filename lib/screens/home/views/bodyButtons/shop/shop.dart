import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_flutter/providers/providerHelper/ProviderState.dart';
import 'package:coin_flutter/screens/home/homePage.dart';
import 'package:coin_flutter/screens/home/views/bodyButtons/shop/finish.dart';
import 'package:coin_flutter/screens/home/views/widgets/popUp.dart';
import 'package:coin_flutter/services/firebase_service.dart';
import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tienda',
                style: titleBlack,
              ),
              Wrap(
                children: [],
              )
              /*   Column(
                  children: model.rewards
                      .map(
                        (item) => SizedBox(
                          width: double.infinity,
                          height: 120,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: Image.network(item['Image']),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(item['Name'].toString(),
                                          style: const TextStyle(fontSize: 16)),
                                      Text("Precio ${item['Value'].toString()}",
                                          style: const TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      compareCoins(model.getUid!.toString(),
                                          item['Id'], context);
                                    },
                                    child: const Text('Comprar'),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
               */
            ],
          );
        });
    /* 
        ProviderState _providerState =
        Provider.of<ProviderState>(context, listen: false);
    Expanded(
      child: FutureBuilder(
        future: getRewards(),
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Tienda'),
                ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: snapshot.data?.length,
                    itemBuilder: ((context, index) => Wrap(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 80,
                              color: Colors.amberAccent,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                child: Wrap(
                                  spacing: 20,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      height: 40,
                                      child: Image.network(
                                          snapshot.data?[index]['Image']),
                                    ),
                                    SizedBox(
                                      width: 120,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "Nombre:${snapshot.data?[index]['Name']}"),
                                          Text(
                                              "Precio:${snapshot.data?[index]['Value']}"),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    TextButton(
                                      onPressed: () {
                                        compareCoins(
                                            _providerState.getUid!.toString(),
                                            snapshot.data?[index]['Id'],
                                            context);
                                      },
                                      child: const Text('Comprar'),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                              width: 10,
                            ),
                          ],
                        )))
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
   */
  }
}

Future<bool> compareCoins(
    String userId, String itemId, BuildContext context) async {
  List pointsUser = [];
  List pointItem = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _collectionUser = _firestore.collection('points');
  final CollectionReference _collectionItem = _firestore.collection('rewards');

  QuerySnapshot queryPointUser =
      await _collectionUser.where('id', isEqualTo: userId).get();

  QuerySnapshot queryPointItem =
      await _collectionItem.where('Id', isEqualTo: itemId).get();

  if (queryPointUser.docs.isNotEmpty) {
    queryPointUser.docs.forEach((element) {
      pointsUser.add(element.data());
    });

    if (queryPointItem.docs.isNotEmpty) {
      queryPointItem.docs.forEach((element) {
        pointItem.add(element.data());
      });
      int ValueUser = pointsUser[0]['value'];
      int ValueItem = pointItem[0]['Value'];
      String nameItem = pointItem[0]['Name'];
      String imageItem = pointItem[0]['Image'];

      debugPrint("-PRUEBA 18 02");
      debugPrint(ValueUser.toString());
      debugPrint(ValueItem.toString());
      debugPrint(nameItem.toString());
      debugPrint(imageItem.toString());

      debugPrint("-PRUEBA 18 02");

      if (ValueUser >= ValueItem) {
        debugPrint("True");

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('¿Seguro que quieres comprar?'),
              content: const Text('Haz clic aceptar para realizar la compra'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Aceptar'),
                  onPressed: () {
                    addShop(userId, nameItem, imageItem);
                    updateCoins(userId, ValueUser, ValueItem, context);

                    Navigator.of(context).pop();

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => FinishShop()),
                    );
                  },
                ),
                TextButton(
                  child: const Text('Cancelar'),
                  onPressed: () {
                    // Cerrar el pop up
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );

        return true;
      } else {
        debugPrint("False");
        return false;
      }
    } else {
      // puedes lanzar una excepción o devolver un valor por defecto
      throw Exception('No se encontraron documentos con id 10');
    }
  } else {
    // puedes lanzar una excepción o devolver un valor por defecto
    throw Exception('No se encontraron documentos con id 10');
  }
}

Future<void> addShop(String uid, String name, String image) async {
  await db.collection("shopping").add({
    "id": uid,
    "date": DateTime.now(),
    "name": name,
    "image": image,
  });
}

Future<void> updateCoinss(String uid, int valueUser, int valueItem) async {
  int newValue = valueUser - valueItem;

  debugPrint("tu nuevos puntos son: $newValue");
  await db.collection("points").doc(uid).set({"id": uid, "value": newValue});
}

Future<void> updateCoins(
    String uid, int valueUser, int valueItem, BuildContext context) async {
  int newValue = valueUser - valueItem;
  // 1. Obtener una referencia a la colección en la que deseas buscar y actualizar documentos.
  final coleccionRef = FirebaseFirestore.instance.collection("points");

  // 2. Realizar una consulta para encontrar los documentos que coincidan con el valor del campo "nombre".
  final query = coleccionRef.where("id", isEqualTo: uid);

  // 3. Ejecutar la consulta utilizando el método get().
  final querySnapshot = await query.get();

  // 4. Iterar sobre los documentos devueltos por la consulta y actualizar la edad de cada documento.
  for (final doc in querySnapshot.docs) {
    await doc.reference.update({"value": newValue});
  }
}
