import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const NextButton({
    super.key,
    required this.onPressed,
    this.text = 'Siguiente',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFA366),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 5, 5, 5),
          ),
        ),
      ),
    );
  }
}
