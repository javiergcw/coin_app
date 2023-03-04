import 'package:coin_flutter/screens/home/homePage.dart';
import 'package:coin_flutter/screens/profile/profile.dart';
import 'package:coin_flutter/screens/quizes/quizes.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    // Aquí se agregarían las diferentes vistas de la aplicación
    // por ejemplo: HomePage(), ProfilePage(), etc.
    HomePage(),
    QRViewExample(),

    Quizes(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xffF1F4FF),
        ),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            color: Colors.white,
          ),
          child: BottomNavigationBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            currentIndex: _currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: _currentIndex == 0
                              ? Colors.red
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.home),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: _currentIndex == 0
                              ? Colors.red
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: _currentIndex == 1
                              ? Colors.red
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.person),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: _currentIndex == 1
                              ? Colors.red
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: _currentIndex == 2
                              ? Colors.red
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.quiz),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: _currentIndex == 2
                              ? Colors.red
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
