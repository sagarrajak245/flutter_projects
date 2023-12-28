import 'package:flutter/material.dart';

class AnsBtn extends StatelessWidget {
  const AnsBtn({required this.onTap, required this.ansText, super.key});

  final String ansText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(),
      child: Text(ansText),
    );
  }
}
