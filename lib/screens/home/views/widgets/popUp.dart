import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PopUp {
  // frist
  void MessageWhats(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('¿Qué es Coin?'),
          content: Text(
              'Este es un texto de ejemplo,Este es un texto de ejemplo,Este es un texto de ejemplo,'),
          actions: <Widget>[
            TextButton(
              child: Text('Cerrar'),
              onPressed: () {
                // Cerrar el pop up
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //second
  void MessageCoins(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('¿Como ganar coins?'),
          content: Text(
              'Este es un texto de ejemplo,Este es un texto de ejemplo,Este es un texto de ejemplo,'),
          actions: <Widget>[
            TextButton(
              child: Text('Cerrar'),
              onPressed: () {
                // Cerrar el pop up
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //buy
  //second
  void MessageAccepts(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('¿Seguro que quieres comprar?'),
          content: Text('Haz clic aceptar para realizar la compra'),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                // Cerrar el pop up
                Navigator.of(context).pop();
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
  }
}
