import 'question_4.dart';
import 'package:flutter/material.dart';
import '/widgets/progress_bar.dart';
import '/widgets/custom_input.dart';

class Question3Screen extends StatefulWidget {
  const Question3Screen({super.key});

  @override
  State<Question3Screen> createState() => _Question3ScreenState();
}

class _Question3ScreenState extends State<Question3Screen> {
  final TextEditingController _tiempoController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();
  final TextEditingController _personasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              const Text(
                'Paso 3 de 5',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(height: 8),
              Center(child: CustomProgressBar(value: 0.6)),
              const SizedBox(height: 24),
              const Text(
                'Cuéntanos más sobre ti y\ntus hábitos de cocina',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Image.asset(
                'assets/habitos-cocina.png',
                width: 140,
                height: 120,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 24),
              CustomInput(
                label: '¿Cuánto tiempo dedicas a cocinar?',
                controller: _tiempoController,
              ),
              const SizedBox(height: 12),
              CustomInput(
                label: '¿Cuál es tu edad?',
                controller: _edadController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              CustomInput(
                label:
                    '¿Para cuántas personas cocinas habitualmente? (incluyéndote)',
                controller: _personasController,
                keyboardType: TextInputType.number,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFA366),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Question4Screen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Siguiente',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tiempoController.dispose();
    _edadController.dispose();
    _personasController.dispose();
    super.dispose();
  }
}
