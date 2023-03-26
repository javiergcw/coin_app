import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.icon,
    required this.hintText,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText, // Para ocultar el texto de la contraseña
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
      ),
    );
  }
}
