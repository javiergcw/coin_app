import 'dart:math';
import 'package:coin_flutter/screens/home/views/widgets/profileBar.dart';
import 'package:coin_flutter/screens/quizes/widgets/containerQuiz.dart';
import 'package:coin_flutter/screens/quizes/widgets/containerQuizBlock.dart';
import 'package:coin_flutter/screens/quizes/widgets/quizBody.dart';
import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';

class _QuizWidgetState extends State<QuizWidget> {
  int preguntaActual = 0;
  int respuestaSeleccionada = -1;
  int respuestaCorrecta() {
    return widget.preguntas[preguntaActual]['respuesta'] as int;
  }

  void verificarRespuesta(int respuesta) {
    setState(() {
      respuestaSeleccionada = respuesta;
    });
    Future<void>.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (respuestaSeleccionada == -1 && respuesta == respuestaCorrecta()) {
          respuestaSeleccionada = -1;
          preguntaActual++;

          if (preguntaActual >= widget.preguntas.length) {
            Navigator.of(context).pop();
          }
        } else {
          respuestaSeleccionada = -1;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> respuestas =
        List<String>.from(widget.preguntas[preguntaActual]['respuestas'])
          ..add(widget.preguntas[preguntaActual]['respuesta'].toString());

    respuestas.shuffle();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const Text(
                    'Quiz',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.preguntas[preguntaActual]['pregunta'] as String,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            UISizedBox.gapH10,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < respuestas.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          if (respuestaSeleccionada == -1) {
                            verificarRespuesta(i);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: respuestaSeleccionada == i
                                ? respuestas[i] ==
                                        respuestaCorrecta().toString()
                                    ? Colors.green
                                    : Colors.red
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            respuestas[i],
                            style: const TextStyle(fontSize: 16),
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
