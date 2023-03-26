import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class customRichText extends StatelessWidget {
  const customRichText(
      {required this.fLabel,
      required this.sLabel,
      required this.onTap,
      super.key});

  final String fLabel;
  final String sLabel;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: fLabel,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: sLabel,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
