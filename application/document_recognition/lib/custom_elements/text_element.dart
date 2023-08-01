import 'package:flutter/material.dart';

class TextElement extends StatelessWidget {
  const TextElement({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: MediaQuery.of(context).size.height / 40,
        fontWeight: FontWeight.bold,
        color: const Color(0xffe65100),
      ),
    );
  }
}
