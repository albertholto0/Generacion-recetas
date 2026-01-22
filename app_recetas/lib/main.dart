import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'configurations/app_theme.dart';
import 'firebase_options.dart';
import 'screens/main_wrapped.dart';
import 'screens/first_start/welcome.dart';

void main() async {
  // En esta parte se inicializa Firebase
  WidgetsFlutterBinding.ensureInitialized();
  // Esto inicializa Firebase con las opciones predeterminadas para la plataforma actual
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const WelcomeScreen(),
      themeMode: ThemeMode.system,
    );
  }
}
