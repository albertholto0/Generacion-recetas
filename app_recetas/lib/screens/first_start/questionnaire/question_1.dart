import 'package:flutter/material.dart';
import '/widgets/progress_bar.dart';

class Question1Screen extends StatefulWidget {
  const Question1Screen({super.key});

  @override
  State<Question1Screen> createState() => _Question1ScreenState();
}

class _Question1ScreenState extends State<Question1Screen> {
  // Lista de herramientas seleccionadas
  final Set<int> _selectedTools = {};

  final List<_ToolData> _tools = const [
    _ToolData(icon: Icons.air, label: 'Freidora'),
    _ToolData(icon: Icons.microwave, label: 'Microondas'),
    _ToolData(icon: Icons.local_laundry_service, label: 'Licuadora'),
    _ToolData(icon: Icons.fireplace, label: 'Estufa'),
    _ToolData(icon: Icons.coffee_maker, label: 'Cafetera'),
    _ToolData(icon: Icons.kitchen, label: 'Horno'),
    _ToolData(icon: Icons.kitchen, label: 'Refrigerador'),
    _ToolData(icon: Icons.soup_kitchen, label: 'Olla'),
    _ToolData(icon: Icons.set_meal, label: 'Sartén'),
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
              CustomProgressBar(value: 0.2),
              const SizedBox(height: 8),
              const Text(
                'Paso 1 de 5',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
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
              const SizedBox(height: 12),
              Expanded(
                child: GridView.builder(
                  itemCount: _tools.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                                color: selected ? Colors.white : Colors.black87,
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
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFA366),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    // Acción siguiente
                  },
                  child: const Text(
                    'Siguiente',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
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
