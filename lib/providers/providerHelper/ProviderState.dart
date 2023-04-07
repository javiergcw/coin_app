import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_flutter/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProviderState extends ChangeNotifier {
  String? _uid;
  String? _email;
  List? _DataPoints;
  List<Map<String, dynamic>> _rewards = [];
  List<Map<String, dynamic>> _buysWithId = [];
  List<Map<String, dynamic>> _infoUserWithId = [];

  int? _points;
  String? get getUid => _uid;
  String? get getEmail => _email;
  List? get getListPoints => _DataPoints;
  int? get points => _points;
  List<Map<String, dynamic>> get rewards => _rewards;
  List<Map<String, dynamic>> get buysWithId => _buysWithId;
  List<Map<String, dynamic>> get infoUserWithId => _infoUserWithId;

  set rewards(List<Map<String, dynamic>> value) {
    _rewards = value;
    notifyListeners();
  }

  set buysWithId(List<Map<String, dynamic>> value) {
    _buysWithId = value;
    notifyListeners();
  }

  void infoUserWithIdV() {
    notifyListeners();
  }

  set infoUserWithId(List<Map<String, dynamic>> value) {
    _infoUserWithId = value;
    notifyListeners();
  }

  FirebaseFirestore db = FirebaseFirestore.instance;

  FirebaseAuth _auth = FirebaseAuth.instance;

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

  Future<List<Map<String, dynamic>>> getInfoUser() async {
    final CollectionReference collectionInfoUser =
        FirebaseFirestore.instance.collection('points');

    QuerySnapshot<Object?> snapshot =
        await collectionInfoUser.where('id', isEqualTo: _uid).get();

    List<QueryDocumentSnapshot<Object?>> documentSnapshots = snapshot.docs;

    List<Map<String, dynamic>> infoUserWithId = documentSnapshots
        .map((document) => document.data() as Map<String, dynamic>)
        .toList();

    this.infoUserWithId = infoUserWithId;
    return infoUserWithId;

    ///
  }

  Future<List<Map<String, dynamic>>> getRewards() async {
    final CollectionReference collectionRewards =
        FirebaseFirestore.instance.collection('rewards');

    QuerySnapshot<Object?> snapshot = await collectionRewards.get();
    List<QueryDocumentSnapshot<Object?>> documentSnapshots = snapshot.docs;

    List<Map<String, dynamic>> rewards = documentSnapshots
        .map((document) => document.data() as Map<String, dynamic>)
        .toList();

    this.rewards = rewards;
    return rewards;
  }

  Future<List<Map<String, dynamic>>> getBuysWithId() async {
    final CollectionReference collectionBuysWithId =
        FirebaseFirestore.instance.collection('shopping');

    QuerySnapshot<Object?> snapshot =
        await collectionBuysWithId.where('id', isEqualTo: _uid).get();
    List<QueryDocumentSnapshot<Object?>> documentSnapshots = snapshot.docs;

    List<Map<String, dynamic>> buysWithId = documentSnapshots
        .map((document) => document.data() as Map<String, dynamic>)
        .toList();
    this.buysWithId = buysWithId;
    return buysWithId;
  }

  Future<String> getterUid() async {
    return _uid!.toString();
  }

  Future<String> getUserId() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      throw Exception('No user logged in');
    }
  }

  Future<String?> getUserMail() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.email;
    } else {
      throw Exception('No user logged in');
    }
  }

  Future<String> GetNameStudentSendPoints(UIDstudent) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final CollectionReference _collectionRef = _firestore.collection('points');

    QuerySnapshot querySnapshot =
        await _collectionRef.where('id', isEqualTo: UIDstudent).get();
    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first.get('name');
    } else {
      throw Exception('No se encontro esa cuenta');
    }
  }

  Future<void> transferPoints(BuildContext context, String receiverId,
      int points, String uidSender) async {
    try {
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;
      final CollectionReference _collectionRef =
          _firestore.collection('points');
      final coleccionRef = FirebaseFirestore.instance.collection('points');

      // Obtener la información del remitente
      DocumentSnapshot senderDoc = await _collectionRef.doc(uidSender).get();
      dynamic senderData = senderDoc.data();
      int senderPoints;
      if (senderData is Map<String, dynamic>) {
        senderPoints = senderData['value'] as int;
      } else {
        throw Exception('No se pudo obtener la información del remitente');
      }

      // Verificar si el remitente tiene suficientes puntos para enviar
      if (senderPoints <= points) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No tienes suficientes puntos'),
          ),
        );
        return;
      }

      // Obtener la información del destinatario
      QuerySnapshot receiver =
          await _collectionRef.where('id', isEqualTo: receiverId).get();
      int receiverPoints = 0;
      if (receiver.docs.isNotEmpty) {
        final receiverData = receiver.docs.first.data();
        if (receiverData is Map<String, dynamic>) {
          receiverPoints = receiverData['value'] as int;
        } else {
          throw Exception('No se encontraron documentos con id $receiverId');
        }
      } else {
        throw Exception('No se encontraron documentos con id $receiverId');
      }

      int newValue = receiverPoints + points;

      // Actualizar los puntos del receptor
      final query = coleccionRef.where("id", isEqualTo: receiverId);
      final querySnapshot = await query.get();
      for (final doc in querySnapshot.docs) {
        await doc.reference.update({"value": newValue});
      }

      // Actualizar los puntos del remitente
      WriteBatch batch = _firestore.batch();
      batch.update(senderDoc.reference, {"value": senderPoints - points});
      await batch.commit();

      // Mostrar mensaje de transacción exitosa
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enviado correctamente'),
        ),
      );
    } catch (e) {
      // Manejo de excepciones
      throw Exception('No se pudo transferir los puntos: $e');
    }
  }

  Future<void> guardarFormulario(
      String body, String mail, String option, String status) async {
    try {
      await FirebaseFirestore.instance.collection('form').add(
          {'body': body, 'mail': mail, 'option': option, 'status': status});
      print('Formulario guardado correctamente');
    } catch (e) {
      print('Error al guardar el formulario: $e');
    }
  }
}
