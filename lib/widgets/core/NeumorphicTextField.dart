import 'package:flutter/material.dart';

Widget NeumorphicTextField(
  BuildContext context, {
  required TextEditingController controller,
  required String labelText,
  required IconData icon,
  bool obscureText = false,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          offset: const Offset(4, 4),
          blurRadius: 15,
          spreadRadius: 1,
        ),
        const BoxShadow(
          color: Colors.white,
          offset: Offset(-4, -4),
          blurRadius: 15,
          spreadRadius: 1,
        ),
      ],
    ),
    child: TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        border: InputBorder.none,
        icon: Icon(icon, color: const Color(0xFF1C4B5F)),
      ),
    ),
  );
}
