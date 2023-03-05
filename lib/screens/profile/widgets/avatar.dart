import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';

class Avatar extends StatefulWidget {
  const Avatar({super.key});

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Container(
        width: 200,
        height: 200,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: UIColors.background,
                    ),
                    width: 50,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: UIColors.black),
                        child: IconButton(
                          onPressed: () {
                            // Agregar aquí la funcionalidad del botón
                          },
                          icon: const Icon(
                            Icons.edit,
                            size: 22,
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
