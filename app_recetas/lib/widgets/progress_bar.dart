import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double value;
  const CustomProgressBar({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      backgroundColor: Colors.grey[200],
      color: const Color(0xFFFFA366),
      minHeight: 6,
    );
  }
}
