import 'package:flutter/material.dart';
import '/widgets/progress_bar.dart';
import '/widgets/custom_input.dart';
import 'question_3.dart';

class Question2Screen extends StatefulWidget {
  const Question2Screen({super.key});

  @override
  State<Question2Screen> createState() => _Question2ScreenState();
}

class _Question2ScreenState extends State<Question2Screen> {
  final TextEditingController _controller = TextEditingController();
  int _step = 0;
  final List<String> _labels = [
    'Soy alérgico a:',
    'No me gusta comer:',
    'Mi dieta excluye:',
  ];
  final List<String?> _answers = [null, null, null];

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
                'Paso 2 de 5',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(height: 8),
              Center(child: CustomProgressBar(value: 0.4)),
              const SizedBox(height: 24),
              const Text(
                'Sobre lo que debemos\nevitar en tu comida',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Image.asset(
                'assets/alergias.png',
                width: 140,
                height: 120,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 24),
              CustomInput(label: _labels[_step], controller: _controller),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 38,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD6F5EC),
                    foregroundColor: const Color(0xFF7B737F),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _answers[_step] = _controller.text;
                      _controller.clear();
                      if (_step < 2) {
                        _step++;
                      }
                    });
                  },
                  child: Text(
                    'Confirmar',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        (_step == 2 &&
                            _answers[2] != null &&
                            _answers[2]!.isNotEmpty)
                        ? const Color(0xFFFFA366)
                        : const Color(0xFFDED6DF),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed:
                      _step == 2 &&
                          _answers[2] != null &&
                          _answers[2]!.isNotEmpty
                      ? () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Question3Screen(),
                            ),
                          );
                        }
                      : null,
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
    _controller.dispose();
    super.dispose();
  }
}
