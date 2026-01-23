import 'package:app_recetas/screens/home/main_wrapped.dart';
import 'package:app_recetas/services/database_service.dart';
import '/services/auth_service.dart';
import '/services/database_service.dart';
import '/screens/home/main_wrapped.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/widgets/confirm_button.dart';
import 'register.dart';
import '../first_start/welcome.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 420),
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 24),
                  const Text(
                    'Iniciar sesión',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Image.asset(
                    'assets/inicio_session.png',
                    width: 180,
                    height: 180,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Correo electrónico',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF9F9F9),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF9F9F9),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ConfirmButton(
                          text: 'Entrar',
                          onPressed: () async {
                            final email = emailController.text.trim();
                            final password = passwordController.text.trim();

                            if (email.isEmpty || password.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Faltan Credenciales. Por favor llena todos los campos',
                                  ),
                                  backgroundColor: Colors.redAccent,
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                              return;
                            }

                            setState(() {
                              isLoading = true;
                            });

                            AuthService authService = AuthService();
                            User? user = await authService
                                .signInWithEmailAndPassword(
                                  emailController.text.trim(),
                                  passwordController.text,
                                );

                            if (mounted) {
                              if (user != null) {
                                bool completed = await DatabaseService()
                                    .hasCompletedQuestionnaire(user.uid);

                                setState(() {
                                  isLoading = false;
                                });

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => completed
                                        ? const MainWrapper()
                                        : const WelcomeScreen(),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Error al iniciar sesión. Verifica tus credenciales.',
                                    ),
                                  ),
                                );
                              }
                            }
                          },
                          textColor: Colors.white,
                        ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text('¿No tienes una cuenta? Regístrate'),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
