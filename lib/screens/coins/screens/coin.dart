import 'package:coin_flutter/screens/coins/widgets/imageCarousel.dart';
import 'package:flutter/material.dart';

class Coin extends StatelessWidget {
  const Coin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE8F0F8),
      body: SafeArea(
        child: Column(
          children: [
            ImageCarousel(
              imageUrls: const [
                'https://picsum.photos/200/300?random=1',
                'https://picsum.photos/200/300?random=2',
                'https://picsum.photos/200/300?random=3',
                'https://picsum.photos/200/300?random=5',
              ],
              titles: const [
                'Imagen 1',
                'Imagen 2',
                'Imagen 3',
                'Imagen 4',
              ],
              subtitles: const [
                'Este es el subtítulo de la imagen 1',
                'Este es el subtítulo de la imagen 2',
                'Este es el subtítulo de la imagen 3',
                'Este es el subtítulo de la imagen 4',
              ],
              body: const [
                'body 1',
                'body 2',
                'body 3',
                'body 4',
              ],
            )
          ],
        ),
      ),
    );
  }
}
