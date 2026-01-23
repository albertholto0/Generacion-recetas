import 'package:flutter/material.dart';
import '/data/tools.dart'; // Importa el archivo anterior

class Question1Content extends StatefulWidget {
  const Question1Content({super.key});

  @override
  State<Question1Content> createState() => _Question1ContentState();
}

class _Question1ContentState extends State<Question1Content> {
  final Set<String> _selectedToolIds = {};
  String _searchQuery = "";

  // Filtramos la lista según lo que escriba el usuario
  List<KitchenTool> get _filteredTools => ToolsRepository.allTools
      .where(
        (tool) => tool.label.toLowerCase().contains(_searchQuery.toLowerCase()),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          '¿Con qué herramientas cuentas?',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        TextField(
          onChanged: (value) => setState(() => _searchQuery = value),
          decoration: InputDecoration(
            hintText: 'Buscar herramienta...',
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: Colors.black12.withOpacity(0.05),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),

        const SizedBox(height: 16),

        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.9,
            ),
            itemCount: _filteredTools.length,
            itemBuilder: (context, index) {
              final tool = _filteredTools[index];
              final isSelected = _selectedToolIds.contains(tool.id);

              return GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected
                        ? _selectedToolIds.remove(tool.id)
                        : _selectedToolIds.add(tool.id);
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFFFA366) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFFFFA366)
                          : Colors.black12,
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        tool.icon,
                        size: 30,
                        color: isSelected ? Colors.white : Colors.orangeAccent,
                      ),
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          tool.label,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontSize: 11,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
