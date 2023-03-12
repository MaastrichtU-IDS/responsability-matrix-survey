import 'package:flutter/material.dart';

class GenericTextField extends StatelessWidget {
  final String hText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  const GenericTextField(
      {Key? key,
      required this.hText,
      required this.controller,
      this.validator,
      this.obscureText = false,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
          hintText: hText,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(10)),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear_rounded),
            onPressed: controller.clear,
          )),
      controller: controller,
    );
  }
}
