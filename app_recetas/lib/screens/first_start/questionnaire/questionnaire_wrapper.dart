import 'package:app_recetas/screens/main_wrapped.dart';
import 'package:flutter/material.dart';
import 'question_1.dart';
import 'question_2.dart';
import 'question_3.dart';
import 'question_4.dart';
import 'question_5.dart';
import '/widgets/progress_bar.dart';
import '/widgets/next_button.dart';

class QuestionnaireWrapper extends StatefulWidget {
  const QuestionnaireWrapper({super.key});

  @override
  State<QuestionnaireWrapper> createState() => _QuestionnaireWrapperState();
}

class _QuestionnaireWrapperState extends State<QuestionnaireWrapper> {
  int _currentStep = 1;
  final int _totalSteps = 5;

  void _nextStep() {
    if (_currentStep < _totalSteps) {
      setState(() => _currentStep++);
    } else {
      //   Navigator.pushAndRemoveUntil(
      //     context,
      //     PageRouteBuilder(
      //       pageBuilder: (context, animation, secondaryAnimation) =>
      //           const MainWrapper(),
      //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //         return FadeTransition(opacity: animation, child: child);
      //       },
      //       transitionDuration: const Duration(milliseconds: 500),
      //     ),
      //     (route) => false,
      //   );
      // }
      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MainWrapper(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 500),
        ),
        (route) => false,
      );
    }
  }

  Widget _getCurrentQuestion() {
    switch (_currentStep) {
      case 1:
        return const Question1Content();
      case 2:
        return const Question2Content();
      case 3:
        return const Question3Content();
      case 4:
        return const Question4Content();
      case 5:
        return const Question5Content();
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Text(
                'Paso $_currentStep de $_totalSteps',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              // La barra de progreso ahora es centralizada
              CustomProgressBar(value: _currentStep / _totalSteps),

              // El contenido que cambia dinámicamente
              Expanded(child: _getCurrentQuestion()),

              const SizedBox(height: 24),
              NextButton(
                onPressed: _nextStep,
                text: _currentStep == _totalSteps ? 'Finalizar' : 'Siguiente',
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
