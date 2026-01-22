import 'package:flutter/material.dart';
import '/widgets/custom_input.dart'; //

class Question2Content extends StatefulWidget {
  const Question2Content({super.key});

  @override
  State<Question2Content> createState() => _Question2ContentState();
}

class _Question2ContentState extends State<Question2Content> {
  final Map<String, TextEditingController> _controllers = {
    'alergias': TextEditingController(),
    'disgustos': TextEditingController(),
    'exclusiones': TextEditingController(),
    'otros': TextEditingController(),
  };

  final List<Map<String, String>> _fieldConfigs = [
    {'id': 'alergias', 'label': 'Soy alérgico a:'},
    {'id': 'disgustos', 'label': 'No me gusta comer:'},
    {'id': 'exclusiones', 'label': 'Mi dieta excluye:'},
    {'id': 'otros', 'label': 'Otras consideraciones:'},
  ];

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: 24),
          const Text(
            'Sobre lo que debemos\nevitar en tu comida',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),

          ..._fieldConfigs.map(
            (config) => Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: CustomInput(
                label: config['label']!,
                controller: _controllers[config['id']]!,
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
