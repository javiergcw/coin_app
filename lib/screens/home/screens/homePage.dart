import 'package:coin_flutter/screens/home/views/historial/historial.dart';
import 'package:coin_flutter/screens/home/views/rules/rules.dart';
import 'package:coin_flutter/screens/home/views/shop/shop.dart';
import 'package:coin_flutter/screens/home/views/widgets/line.dart';
import 'package:coin_flutter/screens/home/views/widgets/popUp.dart';
import 'package:coin_flutter/screens/home/views/widgets/profileBar.dart';
import 'package:coin_flutter/screens/home/views/widgets/textButtonCustom.dart';
import 'package:coin_flutter/utils/res.dart';
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
      backgroundColor: const Color(0xffE8F0F8),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          const ProfileBar(),
                          UISizedBox.gapH20,
                          const Line(),
                          UISizedBox.gapH20,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              CustomTextButton(
                                text: 'Tienda',
                                isSelected: _selectedButton == 0,
                                onPressed: () {
                                  setState(() {
                                    _selectedButton = 0;
                                  });
                                },
                              ),
                              CustomTextButton(
                                text: 'Historial',
                                isSelected: _selectedButton == 1,
                                onPressed: () {
                                  setState(() {
                                    _selectedButton = 1;
                                  });
                                },
                              ),
                              CustomTextButton(
                                text: 'Reglas',
                                isSelected: _selectedButton == 2,
                                onPressed: () {
                                  setState(() {
                                    _selectedButton = 2;
                                  });
                                },
                              ),
                              TextButton(
                                onPressed: () {
                                  PopUp().MessageCoins(context);
                                },
                                child: const Icon(
                                  Icons.tune,
                                  color: UIColors.redQ,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                _selectedButton == 0
                    ? Shop()
                    : _selectedButton == 1
                        ? Buys()
                        : Rules()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
