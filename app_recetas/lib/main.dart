import 'package:flutter/material.dart';
import 'configurations/app_theme.dart';
import 'screens/session.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: LoginScreen(),
      themeMode: ThemeMode.system,
    );
  }
}
