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
              child: Column(
                children: const [
                  UISizedBox.gapH10,
                  ProfileBar(),
                  UISizedBox.gapH30,
                ],
              ),
            ),
            const Text(
              'Quizes',
              style: titleBlack,
            ),
            //HERE

            ContainerQuiz(),
            ContainerQuizBlock()
          ],
        ),
      ),
    );
  }
}
