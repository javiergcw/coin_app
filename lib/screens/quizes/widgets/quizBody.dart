import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final List<Map<String, dynamic>> preguntas;

  QuizWidget({required this.preguntas});

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int _preguntaActual = 0;
  int _puntuacion = 0;

  void _responderPregunta(int indexRespuesta) {
    if (indexRespuesta == 0) {
      _puntuacion++;
    }
    setState(() {
      _preguntaActual++;
    });
  }

  void _anteriorPregunta() {
    setState(() {
      _preguntaActual--;
    });
  }

  void _siguientePregunta() {
    setState(() {
      _preguntaActual++;
    });
  }

  void _reiniciarQuiz() {
    setState(() {
      _preguntaActual = 0;
      _puntuacion = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Quiz'),
      ),
      body: (_preguntaActual < widget.preguntas.length)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    widget.preguntas[_preguntaActual]['pregunta'].toString(),
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                ...(widget.preguntas[_preguntaActual]['respuestas']
                        as List<String>)
                    .map((respuesta) => Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              final indexRespuesta = widget
                                  .preguntas[_preguntaActual]['respuestas']
                                  ?.indexOf(respuesta);
                              _responderPregunta(indexRespuesta);
                            },
                            child: Text(respuesta),
                          ),
                        ))
                    .toList(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_preguntaActual > 0)
                      ElevatedButton(
                        onPressed: _anteriorPregunta,
                        child: Text('Anterior'),
                      ),
                    SizedBox(width: 20),
                    if (_preguntaActual < widget.preguntas.length - 1)
                      ElevatedButton(
                        onPressed: () {
                          if (_preguntaActual == widget.preguntas.length - 2) {
                            _siguientePregunta();
                            _siguientePregunta();
                          } else {
                            _siguientePregunta();
                          }
                        },
                        child: Text(
                            _preguntaActual == widget.preguntas.length - 2
                                ? 'Finalizar'
                                : 'Siguiente'),
                      ),
                  ],
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '¡Felicidades, has terminado el quiz!',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Puntuación final: $_puntuacion',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _reiniciarQuiz,
                    child: Text('Volver a jugar'),
                  ),
                ],
              ),
            ),
    );
  }
}
