import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_flutter/providers/providerHelper/ProviderState.dart';
import 'package:coin_flutter/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RewardsList extends StatelessWidget {
  const RewardsList({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderState _providerState =
        Provider.of<ProviderState>(context, listen: false);
    return Expanded(
      child: FutureBuilder(
        future: getRewards(),
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: snapshot.data?.length,
                itemBuilder: ((context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 100,
                        height: 200,
                        color: Colors.amberAccent,
                        child: Column(
                          children: [
                            Container(
                              width: 100,
                              height: 40,
                              child:
                                  Image.network(snapshot.data?[index]['Image']),
                            ),
                            Text("Nombre:" + snapshot.data?[index]['Name']),
                            Text("Precio:" +
                                (snapshot.data?[index]['Value']).toString()),
                            TextButton(
                              onPressed: () {
                                compareCoins(_providerState.getUid!.toString(),
                                    snapshot.data?[index]['Id']);
                              },
                              child: Text('TextButton'),
                            )
                          ],
                        ),
                      ),
                    )),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}

Future<bool> compareCoins(String userId, String itemId) async {
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
        addShop(userId, nameItem, imageItem);
        updateCoins(userId, ValueUser, ValueItem);
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

Future<void> updateCoins(String uid, int valueUser, int valueItem) async {
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
