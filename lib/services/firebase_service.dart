import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getRewards() async {
  List rewards = [];
  CollectionReference collectionReferenceRewards = db.collection('rewards');

  QuerySnapshot queryRewards = await collectionReferenceRewards.get();

  queryRewards.docs.forEach((document) {
    rewards.add(document.data());
  });

  return rewards;
}

Future<void> addPointProfile(String uid, String name) async {
  await db.collection("points").add({
    "id": uid,
    "value": 0,
    "name": name,
  });
}
