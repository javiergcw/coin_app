

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  final List<QuizResult> quizResults = [
    QuizResult('Cuestionario 1', 75, Colors.blue),
    QuizResult('Cuestionario 2', 90, Colors.red),
    QuizResult('Cuestionario 3', 60, Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress Bar"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Progress bar'),
              Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      series: <ChartSeries>[
                        ColumnSeries<QuizResult, String>(
                          dataSource: quizResults,
                          xValueMapper: (QuizResult result, _) =>
                              result.quizName,
                          yValueMapper: (QuizResult result, _) =>
                              result.percentage,
                          pointColorMapper: (QuizResult result, _) =>
                              result.color,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ...quizResults.map((result) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(child: Text(result.quizName)),
                          SizedBox(width: 8),
                          Text('${result.percentage}%'),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizResult {
  final String quizName;
  final double percentage;
  final Color color;

  QuizResult(this.quizName, this.percentage, this.color);
}
