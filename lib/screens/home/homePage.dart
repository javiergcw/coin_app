import 'package:coin_flutter/screens/home/views/bodyButtons/buys.dart';
import 'package:coin_flutter/screens/home/views/bodyButtons/shop.dart';
import 'package:coin_flutter/screens/home/views/widgets/popUp.dart';
import 'package:coin_flutter/screens/home/views/widgets/profileBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Definir una variable para controlar el estado de los botones
  int _selectedButton = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi aplicación'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              const ProfileBar(),
              // Mostrar los botones
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedButton == 0
                          ? Colors.blue
                          : Colors.transparent,
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedButton = 0;
                      });
                    },
                    child: const Text('Tienda'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedButton == 1
                          ? Colors.blue
                          : Colors.transparent,
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedButton = 1;
                      });
                    },
                    child: const Text('Historial'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedButton == 2
                          ? Colors.blue
                          : Colors.transparent,
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedButton = 2;
                      });
                    },
                    child: const Text('Reglas'),
                  ),
                  TextButton(
                      onPressed: () {
                        PopUp().MessageCoins(context);
                      },
                      child: const Icon(
                        Icons.account_tree,
                      ))
                ],
              ),
              // Mostrar el contenido correspondiente al botón seleccionado
              Expanded(
                child: _selectedButton == 0
                    ? SingleChildScrollView(child: Shop())
                    : _selectedButton == 1
                        ? Buys()
                        : Container(
                            child: Center(
                              child: Text('Página de objetos'),
                            ),
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
