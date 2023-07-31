import 'package:flutter/material.dart';

class TextElement extends StatelessWidget {
  const TextElement({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Color(0xffe65100),
      ),
    );
  }
}
