import 'package:flutter/material.dart';
import 'home.dart';
import 'recipes.dart';
import 'kitchen.dart';
import 'cupboard.dart';
import 'profile.dart';
import '../../widgets/navigation_bar.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 0;

  // Lista de todas tus pantallas en el orden de la barra
  final List<Widget> _screens = const [
    HomeScreen(),
    RecipesScreen(),
    KitchenScreen(),
    CupboardScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack mantiene el estado de las pantallas y cambia instantáneamente
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
