import 'package:app_recetas/screens/home/main_wrapped.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'question_1.dart';
import 'question_2.dart';
import 'question_3.dart';
import 'question_4.dart';
import 'question_5.dart';
import '/widgets/progress_bar.dart';
import '/widgets/next_button.dart';
import '/services/database_service.dart';
import '/services/questionnaire_provider.dart';

class QuestionnaireWrapper extends StatefulWidget {
  const QuestionnaireWrapper({super.key});

  @override
  State<QuestionnaireWrapper> createState() => _QuestionnaireWrapperState();
}

class _QuestionnaireWrapperState extends State<QuestionnaireWrapper> {
  int _currentStep = 1;
  final int _totalSteps = 5;

  void _nextStep() async {
    if (_currentStep < _totalSteps) {
      setState(() => _currentStep++);
    } else {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      Map<String, dynamic> finalData = QuestionnaireData().toMap();

      await DatabaseService().saveQuestionnaireResults(uid, finalData);

      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MainWrapper()),
          (route) => false,
        );
      }

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
              CustomProgressBar(value: _currentStep / _totalSteps),
              Expanded(child: _getCurrentQuestion()),
              const SizedBox(height: 8),
              Row(
                children: [
                  if (_currentStep > 1)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => setState(() => _currentStep--),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          side: const BorderSide(color: Colors.black12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Atras',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                  if (_currentStep > 1) const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: NextButton(
                      onPressed: _nextStep,
                      text: _currentStep == _totalSteps
                          ? 'Finalizar'
                          : 'Siguiente',
                    ),
                  ),
                ],
              ),

              // const SizedBox(height: 24),
              // NextButton(
              //   onPressed: _nextStep,
              //   text: _currentStep == _totalSteps ? 'Finalizar' : 'Siguiente',
              // ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
