import 'package:coin_flutter/screens/quizes/widgets/quizBody.dart';
import 'package:flutter/material.dart';

class QuizesCopy extends StatelessWidget {
  const QuizesCopy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60),
          const Text("Quizes"),
          Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            QuizWidget(preguntas: _preguntas)),
                  );
                },
                child: const Text(
                  "Primer quiz",
                ),
              )
            ],
          )
        ],
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
