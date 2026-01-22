import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/widgets/custom_dropdown.dart';
import '/widgets/custom_input.dart';

class Question3Content extends StatefulWidget {
  const Question3Content({super.key});

  @override
  State<Question3Content> createState() => _Question3ContentState();
}

class _Question3ContentState extends State<Question3Content> {
  String? _tiempoSelected;
  final TextEditingController _edadController = TextEditingController();
  final TextEditingController _personasController = TextEditingController();

  final List<String> tiempoOptions = [
    'Menos de 15 minutos',
    '15-30 minutos',
    '30-60 minutos',
    'Más de 1 hora',
  ];

  @override
  void dispose() {
    _edadController.dispose();
    _personasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          const Text(
            'Cuéntanos un poco más',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),

          CustomDropdown(
            label: '¿Cuánto tiempo dedicas a cocinar?',
            items: tiempoOptions,
            value: _tiempoSelected,
            onChanged: (value) {
              setState(() {
                _tiempoSelected = value;
              });
            },
          ),

          const SizedBox(height: 24),

          CustomInput(
            label: '¿Cuál es tu edad?',
            controller: _edadController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),

          const SizedBox(height: 24),

          CustomInput(
            label:
                '¿Para cuántas personas cocinas habitualmente? (incluyéndote)',
            controller: _personasController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
