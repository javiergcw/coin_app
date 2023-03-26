import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  const customButton({
    required this.onPressed,
    required this.label,
    super.key,
  });

  final void Function()? onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size(
            double.infinity,
            50,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      child: Text(label),
    );
  }
}
