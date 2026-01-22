import 'package:flutter/material.dart';
import '/widgets/custom_input.dart';

class Question2Content extends StatefulWidget {
  const Question2Content({super.key});

  @override
  State<Question2Content> createState() => _Question2ContentState();
}

class _Question2ContentState extends State<Question2Content> {
  final TextEditingController _controller = TextEditingController();
  int _internalStep = 0; // Controla el paso interno de esta pregunta

  final List<String> _labels = [
    'Soy alérgico a:',
    'No me gusta comer:',
    'Mi dieta excluye:',
  ];

  final List<String?> _answers = [null, null, null];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Retornamos directamente el contenido central
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 24),
        const Text(
          'Sobre lo que debemos\nevitar en tu comida',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        const Text(
          'Esto nos ayudará a filtrar recetas que no\npuedas o no quieras consumir.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, color: Colors.black54),
        ),
        const SizedBox(height: 32),

        // Input dinámico basado en el paso interno
        CustomInput(label: _labels[_internalStep], controller: _controller),

        const SizedBox(height: 16),

        // Botón de confirmar interno
        SizedBox(
          width: double.infinity,
          height: 45,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7B737F),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              setState(() {
                _answers[_internalStep] = _controller.text;
                _controller.clear();
                if (_internalStep < 2) {
                  _internalStep++;
                }
              });
            },
            child: Text(
              _internalStep < 2 ? 'Confirmar' : 'Guardar cambios',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ),

        // Pequeño indicador de progreso interno
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _internalStep >= index
                    ? const Color(0xFF7B737F)
                    : Colors.black12,
              ),
            );
          }),
        ),
      ],
    );
  }
}
