import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double value;
  const CustomProgressBar({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    const double barWidth = 200;
    const double barHeight = 8;
    const borderRadius = BorderRadius.all(Radius.circular(8));
    return SizedBox(
      width: barWidth,
      height: barHeight,
      child: Stack(
        children: [
          Container(
            width: barWidth,
            height: barHeight,
            decoration: BoxDecoration(
              color: const Color(0xFFE1D7E2),
              borderRadius: borderRadius,
            ),
          ),
          // Progreso
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: barWidth * value.clamp(0.0, 1.0),
            height: barHeight,
            decoration: BoxDecoration(
              color: const Color(0xFF7B737F),
              borderRadius: borderRadius,
            ),
          ),
        ],
      ),
    );
  }
}
