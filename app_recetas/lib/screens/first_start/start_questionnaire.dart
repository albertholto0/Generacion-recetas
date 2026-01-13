import 'package:flutter/material.dart';
import '../home.dart';
import '/widgets/confirm_button.dart';
import 'questionnaire/question_1.dart';

class StartQuestionnaireScreen extends StatelessWidget {
  const StartQuestionnaireScreen({super.key});

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
                'Para crear recetas perfectas,\nnecesitamos conocerte mejor',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32),
              Image.asset(
                'assets/questionnaire.png',
                width: 250,
                height: 250,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 48),
              ConfirmButton(
                text: 'Comenzar',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Question1Screen(),
                    ),
                  );
                },
                textColor: Colors.black,
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text(
                  'Responder más tarde',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 118, 118, 118),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
