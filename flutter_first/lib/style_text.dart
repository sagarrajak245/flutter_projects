import 'package:flutter/material.dart';

class StyleText extends StatelessWidget {
  const StyleText(this.text, {super.key});

  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.normal,
        color: Colors.white,
        backgroundColor: Color.fromARGB(255, 170, 86, 244),
      ),
    );
  }
}

// 