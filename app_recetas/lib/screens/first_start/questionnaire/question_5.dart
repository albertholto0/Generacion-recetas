import 'package:flutter/material.dart';

class Question5Content extends StatelessWidget {
  const Question5Content({super.key});

  @override
  Widget build(BuildContext context) {
    // Retornamos directamente el contenido de éxito
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 48),
        const Text(
          '¡Perfecto!\nYa te conozco.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 18),
        const Text(
          'A partir de ahora, mi trabajo es sorprendente.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 48),
        // Imagen decorativa
        Expanded(
          child: Image.asset(
            'assets/gato-chef.png',
            width: 300,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 24),
        // Nota: El botón "Ir a la pantalla principal" ya no va aquí,
        // lo pondrá el QuestionnaireWrapper automáticamente.
      ],
    );
  }
}
