import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:CoinWrap/providers/providerHelper/ProviderState.dart';
import 'package:CoinWrap/screens/home/views/shop/finish.dart';
import 'package:CoinWrap/screens/home/views/shop/widgets/containerReward.dart';
import 'package:CoinWrap/screens/home/views/shop/widgets/containerRewardsPrecargado.dart';
import 'package:CoinWrap/screens/home/views/widgets/popUp.dart';
import 'package:CoinWrap/services/firebase_service.dart';
import 'package:CoinWrap/utils/res.dart';
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
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    buildShimmerContainer(context),
                    buildShimmerContainer(context),
                    buildShimmerContainer(context),
                    buildShimmerContainer(context),
                  ],
                ),
              )
            ],
          );
        }
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tienda',
                style: titleBlack,
              ),
              UISizedBox.gapH10,
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: model.rewards
                    .map(
                      (item) => Column(
                        children: [
                          ContainerReward(
                            colorPrimary: item['colorPrimary'],
                            colorSecondary: item['colorSecondary'],
                            image: "assets/images/${item['Image']}.png",
                            onTap: () {
                              compareCoins(model.getUid!.toString(), item['Id'],
                                  context);
                            },
                            name: item['Name'].toString(),
                            value: item['Value'].toString(),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
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
        PopUp().missedCoins(context);
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
    "status": "0",
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
