import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: label.contains('Telefon') ? TextInputType.phone : null,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$label boş olamaz';
        }
        if (label.contains('Telefon') && value.length < 10) {
          return 'Geçerli bir telefon numarası girin';
        }
        if (label.contains('Kod') && value.length != 6) {
          return 'Kod 6 haneli olmalı';
        }
        return null;
      },
    );
  }
}
