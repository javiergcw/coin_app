import 'package:flutter/material.dart';
import 'dart:math';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Preguntas del cuestionario
  List<String> preguntas = [
    "¿Cuál es la capital de Francia?",
    "¿Cuál es el río más largo del mundo?"
  ];

  // Respuestas de cada pregunta
  Map<String, String> respuestas = {
    "¿Cuál es la capital de Francia?": "París",
    "¿Cuál es el río más largo del mundo?": "Nilo"
  };

  // Estado actual del cuestionario
  int preguntaActual = 0;
  int puntos = 0;

  // Método para verificar la respuesta del usuario
  void verificarRespuesta(String respuesta) {
    String respuestaCorrecta = respuestas[preguntas[preguntaActual]]!;
    if (respuesta == respuestaCorrecta) {
      setState(() {
        puntos++;
      });
    }
    siguientePregunta();
  }

  // Método para avanzar a la siguiente pregunta
  void siguientePregunta() {
    setState(() {
      preguntaActual = Random().nextInt(preguntas.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cuestionario"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              preguntas[preguntaActual],
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => verificarRespuesta("París"),
              child: Text("París"),
            ),
            ElevatedButton(
              onPressed: () => verificarRespuesta("Londres"),
              child: Text("Londres"),
            ),
            ElevatedButton(
              onPressed: () => verificarRespuesta("Nueva York"),
              child: Text("Nueva York"),
            ),
            ElevatedButton(
              onPressed: () => verificarRespuesta("Nilo"),
              child: Text("Nilo"),
            ),
            ElevatedButton(
              onPressed: () => verificarRespuesta("Amazonas"),
              child: Text("Amazonas"),
            ),
            SizedBox(height: 20),
            Text(
              "Puntos: $puntos",
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
