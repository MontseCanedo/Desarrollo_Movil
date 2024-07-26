import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final bool obscureText;
  final void Function(String text) onChanged;
  final String? Function(String? text)? validator;
  const InputText({
    super.key,
    required this.label,
    required this.keyboardType,
    required this.obscureText,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Color.fromARGB(255, 190, 1, 97),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
