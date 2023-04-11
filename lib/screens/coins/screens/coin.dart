import 'package:CoinWrap/screens/coins/widgets/imageCarousel.dart';
import 'package:CoinWrap/utils/res.dart';
import 'package:flutter/material.dart';

class Coin extends StatelessWidget {
  const Coin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE8F0F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Algunas implementaciones de Gamificación',
                  style: titleBlack,
                  textAlign: TextAlign.center,
                ),
              ),
              UISizedBox.gapH20,
              ImageCarousel(
                imageUrls: const [
                  'https://www.alfabetizaciondigital.redem.org/wp-content/uploads/2017/10/las-TIC-en-la-educaci%C3%B3n-777x437.jpg',
                  'https://www.unir.net/wp-content/uploads/2020/05/ticacula.jpg',
                  'https://www.fuenlabradanoticias.com/asset/thumbnail,1920,1080,center,center/media/fuenlabradanoticias/images/2021/07/10/5884_tic-educacion-1.jpg',
                ],
                titles: const [
                  'La implementación de la tecnología en la educación: Retos y oportunidades',
                  'Incorporating New Technologies into Teaching and Learning',
                  'La implementación de las Tecnologías de la Información y la Comunicación en la educación en Colombia',
                ],
                subtitles: const [
                  'Martínez-Garza',
                  'Johnson y Johnson',
                  'Montenegro y Botero',
                ],
                body: const [
                  'La incorporación de la tecnología en la educación ha sido una tendencia en constante crecimiento en los últimos años, con el objetivo de mejorar la calidad del aprendizaje. Sin embargo, su implementación puede presentar retos importantes, como la necesidad de una formación adecuada para los maestros, el acceso a los recursos tecnológicos y la falta de una evaluación rigurosa de los resultados de aprendizaje. A pesar de estos retos, la tecnología ofrece oportunidades únicas para crear ambientes de aprendizaje personalizados y motivadores que promuevan la participación activa de los estudiantes."',
                  '"La incorporación de nuevas tecnologías en la enseñanza y el aprendizaje puede tener un impacto significativo en el compromiso y éxito de los estudiantes. Tecnologías como plataformas de aprendizaje en línea, recursos multimedia y herramientas digitales de evaluación ofrecen oportunidades para experiencias de aprendizaje personalizadas e interactivas. Sin embargo, la implementación efectiva de estas tecnologías requiere un enfoque integral que incluya la provisión de recursos adecuados, el desarrollo profesional continuo para educadores y la elaboración de estrategias para abordar la brecha digital. Para aprovechar al máximo el potencial de las nuevas tecnologías en la educación, es importante evaluar continuamente su impacto en los resultados de los estudiantes y ajustar las estrategias de implementación en consecuencia."',
                  '"La implementación de las Tecnologías de la Información y la Comunicación (TIC) en la educación en Colombia ha sido un tema importante en los últimos años, con el objetivo de mejorar la calidad del aprendizaje y reducir la brecha digital. Sin embargo, su implementación ha presentado desafíos importantes, como la falta de recursos y la necesidad de una formación adecuada para los docentes. A pesar de estos desafíos, las TIC ofrecen oportunidades únicas para crear ambientes de aprendizaje personalizados y motivadores que promuevan la participación activa de los estudiantes, y han sido especialmente útiles en contextos de educación a distancia debido a la pandemia de COVID-19."',
                ],
                icon: [Icons.abc, Icons.spatial_audio, Icons.table_chart],
              )
            ],
          ),
        ),
      ),
    );
  }
}
