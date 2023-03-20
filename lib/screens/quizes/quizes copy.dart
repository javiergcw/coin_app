/* import 'package:coin_flutter/screens/quizes/widgets/quizBody.dart';
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
                },/*  */
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

 */