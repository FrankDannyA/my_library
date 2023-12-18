import 'package:flutter/material.dart';

class TextFieldDecorated extends StatelessWidget {
  const TextFieldDecorated({
    super.key,
    required this.title,
    required this.controller,
    this.isPass = false,
  });

  final bool isPass;
  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPass,
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.brown.shade100,
        filled: true,
        hintText: title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.brown.shade200),
        ),
      ),
    );
  }
}
