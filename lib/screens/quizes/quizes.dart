import 'package:coin_flutter/screens/home/views/widgets/profileBar.dart';

import 'package:coin_flutter/screens/quizes/widgets/containerQuiz.dart';
import 'package:coin_flutter/screens/quizes/widgets/containerQuizBlock.dart';
import 'package:coin_flutter/screens/quizes/widgets/quizBody.dart';

import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';

class Quizes extends StatelessWidget {
  const Quizes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE8F0F8),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: const [
                    ProfileBar(),
                    UISizedBox.gapH30,
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                runSpacing: 10,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  const Text(
                    'Quizes',
                    style: titleBlack,
                  ),
                  //HERE

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  QuizWidget(preguntas: _preguntas)));
                    },
                    child: const ContainerQuiz(),
                  ),
                  const ContainerQuizBlock()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> _preguntas = [
  {
    'pregunta': '¿Cuál es la capital de Francia?',
    'respuestas': ['París', 'Londres', 'Madrid', 'Berlín'],
  },
  {
    'pregunta': '¿Quién escribió "Don Quijote de la Mancha"?',
    'respuestas': [
      'Miguel de Cervantes',
      'Federico García Lorca',
      'Pablo Neruda',
      'Jorge Luis Borges'
    ],
  },
  {
    'pregunta': '¿Cuál es el océano más grande del mundo?',
    'respuestas': [
      'El Océano Pacífico',
      'El Océano Atlántico',
      'El Océano Índico',
      'El Océano Glacial Ártico'
    ],
  },
  {
    'pregunta': '¿En qué año comenzó la Segunda Guerra Mundial?',
    'respuestas': ['1939', '1914', '1945', '1936'],
  },
  {
    'pregunta': '¿Quién es el autor de la obra "La Odisea"?',
    'respuestas': ['Homero', 'Virgilio', 'Ovidio', 'Cervantes'],
  },
];
