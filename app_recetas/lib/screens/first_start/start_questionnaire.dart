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
          child: Container(
            constraints: BoxConstraints(maxWidth: 350),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 32),
                Text(
                  'Para crear recetas perfectas,\nnecesitamos conocerte mejor',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Si desea responder más tarde...'),
                          content: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Puede acceder al cuestionario desde ',
                                ),
                                TextSpan(
                                  text: 'Ajustes > Responder Cuestionario',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      ', pero solamente podrá usar todas las funciones de la app después de completarlo.',
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                );
                              },
                              child: Text('Confirmar'),
                            ),
                          ],
                        );
                      },
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
      ),
    );
  }
}
