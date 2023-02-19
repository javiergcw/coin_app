import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_flutter/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class ProviderState extends ChangeNotifier {
  String? _uid;
  String? _email;
  List? _DataPoints;
  int? _points;

  String? get getUid => _uid;
  String? get getEmail => _email;
  List? get getListPoints => _DataPoints;
  int? get points => _points;

  FirebaseFirestore db = FirebaseFirestore.instance;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List> getBuysId() async {
    List buys = [];
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final CollectionReference _collectionRef =
        _firestore.collection('shopping');

    QuerySnapshot querySnapshot =
        await _collectionRef.where('id', isEqualTo: _uid).get();

    if (querySnapshot.docs.isNotEmpty) {
      querySnapshot.docs.forEach((element) {
        buys.add(element.data());
      });

      debugPrint("------------ 8 52");
      debugPrint(buys.toString());
      debugPrint("------------ 8 52");
      return buys;
    } else {
      // puedes lanzar una excepción o devolver un valor por defecto
      throw Exception('No se encontraron documentos con id 10');
    }
  }

  Future<List> getCoinId() async {
    List points = [];
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final CollectionReference _collectionRef = _firestore.collection('points');

    QuerySnapshot querySnapshot =
        await _collectionRef.where('id', isEqualTo: _uid).get();

    if (querySnapshot.docs.isNotEmpty) {
      querySnapshot.docs.forEach((element) {
        points.add(element.data());
      });
      return points;
    } else {
      // puedes lanzar una excepción o devolver un valor por defecto
      throw Exception('No se encontraron documentos con id 10');
    }
  }

  Future<bool> signUpUser(String email, String password, String name) async {
    bool retval = false;

    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        _uid = userCredential.user!.uid;
        _email = userCredential.user!.email!;
        addPointProfile(_uid!, name);
        return retval = true;
      }
    } catch (e) {
      print(e);
    }

    return retval;
  }

  Future<bool> LoginUser(String email, String password) async {
    bool retval = false;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (userCredential.user != null) {
        _uid = userCredential.user!.uid;
        _email = userCredential.user!.email!;
        return retval = true;
      }
    } catch (e) {
      print(e);
    }

    return retval;
  }
}


 /*  Future<bool> getPoints() async {
    bool retval = false;

    try {
      List _DataPoints = [];

      final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      debugPrint("---------UID--------");
      debugPrint(_uid);

      final QuerySnapshot queryPoints = await _firestore
          .collection('points')
          .where('id', isEqualTo: _uid.toString())
          .get();

      queryPoints.docs.forEach((document) {
        _DataPoints.add(document.data());
      });
      debugPrint("---------ARREGLO--------");
      debugPrint(_DataPoints.toString());

      List? DataPoints = _DataPoints;
      int _points = DataPoints[0]['value'];
      debugPrint("---------puntos--------");
      debugPrint(_points.toString());

      return retval = true;
    } catch (e) {
      print(e);
    }
    return retval;
  }
 */