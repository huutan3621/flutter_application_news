import 'package:flutter/material.dart';

class PressButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const PressButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }
}
