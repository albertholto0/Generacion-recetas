import 'package:flutter/material.dart';
import 'start_questionnaire.dart';
import '../../widgets/confirm_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 32),
              Text(
                'La inteligencia\nartificial que\ncocina contigo',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32),
              Image.asset(
                'assets/welcome.png',
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 48),
              ConfirmButton(
                text: 'Siguiente',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StartQuestionnaireScreen(),
                    ),
                  );
                },
                textColor: Colors.black,
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
