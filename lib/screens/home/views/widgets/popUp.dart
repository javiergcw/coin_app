import 'package:flutter/material.dart';

class PopUp {
  // frist
  void MessageWhats(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Coin Wrap'),
          content: Text(
            '¡Gana monedas en tu clase! Tus logros en las actividades se convertirán en monedas que podrás utilizar para desbloquear recompensas dentro de la aplicación. Recuerda que estas monedas no se pueden comprar con dinero real, ¡solo puedes obtenerlas a través de tu esfuerzo y dedicación en las actividades!',
            textAlign: TextAlign.justify,
          ),
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
          title: Text('Breve descripción'),
          content: Text(
            'La Tienda te permite comprar artículos utilizando puntos. Puedes ganar puntos a través de diferentes actividades dentro de la aplicación. En Historial puedes ver todas las compras que has realizado y su estado, ya sea reclamado o sin reclamar.',
            textAlign: TextAlign.justify,
          ),
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

  void missedCoins(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Insuficientes puntos'),
          content: Text(
            'Lo sentimos, no tienes suficientes puntos para comprar este premio en este momento. Sigue participando en nuestras actividades y ganando puntos para poder desbloquear más recompensas emocionantes en el futuro. ¡No te desanimes y sigue esforzándote!',
            textAlign: TextAlign.justify,
          ),
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
