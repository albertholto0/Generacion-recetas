import 'package:flutter/material.dart';
import '/widgets/progress_bar.dart';
import 'question_2.dart';
import '/widgets/next_button.dart';

class Question1Screen extends StatefulWidget {
  const Question1Screen({super.key});

  @override
  State<Question1Screen> createState() => _Question1ScreenState();
}

class _Question1ScreenState extends State<Question1Screen> {
  final Set<int> _selectedTools = {};

  final List<_ToolData> _tools = const [
    _ToolData(icon: Icons.air, label: 'Freidora'),
    _ToolData(icon: Icons.microwave, label: 'Microondas'),
    _ToolData(icon: Icons.blender, label: 'Licuadora'),
    _ToolData(icon: Icons.fireplace, label: 'Estufa'),
    _ToolData(icon: Icons.coffee_maker, label: 'Cafetera'),
    _ToolData(icon: Icons.kitchen, label: 'Horno'),
    _ToolData(icon: Icons.kitchen, label: 'Refrigerador'),
    _ToolData(icon: Icons.soup_kitchen, label: 'Olla'),
    _ToolData(icon: Icons.set_meal, label: 'Sartén'),
    _ToolData(icon: Icons.local_drink, label: 'Vaso medidor'),
    _ToolData(icon: Icons.scale, label: 'Báscula de cocina'),
    _ToolData(icon: Icons.restaurant, label: 'Procesador de alimentos'),
    _ToolData(icon: Icons.bakery_dining, label: 'Tostadora'),
    _ToolData(icon: Icons.bubble_chart, label: 'Tetera'),
    _ToolData(icon: Icons.filter_list, label: 'Colador'),
    _ToolData(icon: Icons.lunch_dining, label: 'Plato hondo'),
    _ToolData(icon: Icons.water_drop, label: 'Exprimidor'),
    _ToolData(icon: Icons.dashboard, label: 'Tabla de cortar'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 24),
              const Text(
                'Paso 1 de 5',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(height: 8),
              CustomProgressBar(value: 0.2),
              const SizedBox(height: 16),
              const Text(
                '¿Con que herramientas\nde cocina cuentas?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Image.asset(
                'assets/herramientas-cocina.png',
                width: 140,
                height: 120,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 16),
              const Text(
                'Seleccione',
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _tools.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 1,
                        ),
                    itemBuilder: (context, index) {
                      final selected = _selectedTools.contains(index);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selected) {
                              _selectedTools.remove(index);
                            } else {
                              _selectedTools.add(index);
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selected
                                ? Color(0xFFFFA366)
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(16),
                            border: selected
                                ? Border.all(color: Color(0xFFFFA366), width: 2)
                                : null,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                _tools[index].icon,
                                size: 36,
                                color: selected ? Colors.white : Colors.black54,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                _tools[index].label,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: selected
                                      ? Colors.white
                                      : Colors.black87,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
              NextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Question2Screen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _ToolData {
  final IconData icon;
  final String label;
  const _ToolData({required this.icon, required this.label});
}
