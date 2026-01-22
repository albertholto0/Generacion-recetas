import 'package:flutter/material.dart';

class Question1Content extends StatefulWidget {
  const Question1Content({super.key});

  @override
  State<Question1Content> createState() => _Question1ContentState();
}

class _Question1ContentState extends State<Question1Content> {
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
  ];

  @override
  Widget build(BuildContext context) {
    // Retornamos directamente una Column o el contenido
    // Ya no hay Scaffold, SafeArea, ProgressBar ni NextButton aquí
    return Column(
      children: [
        const SizedBox(height: 24),
        const Text(
          '¿Con qué herramientas\nde cocina cuentas?',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: Scrollbar(
            thumbVisibility: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.85,
                ),
                itemCount: _tools.length,
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
                            ? const Color(0xFFFFA366)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: selected
                              ? const Color(0xFFFFA366)
                              : Colors.black12,
                          width: 1.5,
                        ),
                        boxShadow: [
                          if (selected)
                            BoxShadow(
                              color: const Color(0xFFFFA366).withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                        ],
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
          ),
        ),
      ],
    );
  }
}

// Mantenemos la clase de datos al final
class _ToolData {
  final IconData icon;
  final String label;
  const _ToolData({required this.icon, required this.label});
}
