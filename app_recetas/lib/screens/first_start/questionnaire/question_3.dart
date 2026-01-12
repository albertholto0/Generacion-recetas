import 'package:flutter/material.dart';
import '/widgets/progress_bar.dart';

class Question3Screen extends StatelessWidget {
  const Question3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Pantalla 3'),
              SizedBox(height: 16),
              CustomProgressBar(value: 0.6),
            ],
          ),
        ),
      ),
    );
  }
}
