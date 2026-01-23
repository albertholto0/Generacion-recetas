import 'package:flutter/material.dart';
import '/widgets/custom_input.dart';

class Question4Content extends StatefulWidget {
  const Question4Content({super.key});

  @override
  State<Question4Content> createState() => _Question4ContentState();
}

class _Question4ContentState extends State<Question4Content> {
  final Set<int> _selectedOptions = {};
  final TextEditingController _otraController = TextEditingController();

  final List<_RestrictionOption> _options = const [
    _RestrictionOption(title: 'Picante', subtitle: 'Evitar alimentos picantes'),
    _RestrictionOption(
      title: 'Lácteos',
      subtitle: 'Evitar alimentos con leche',
    ),
    _RestrictionOption(title: 'Dieta blanda', subtitle: 'Me encuentro enfermo'),
    _RestrictionOption(title: 'Ninguna por el momento', subtitle: ''),
    _RestrictionOption(title: 'Otra', subtitle: 'Especificar restricción'),
  ];

  @override
  void dispose() {
    _otraController.dispose();
    super.dispose();
  }

  void _handleToggle(int index, bool isSelected) {
    setState(() {
      if (index == 3) {
        _selectedOptions.clear();
        if (isSelected) _selectedOptions.add(3);
      } else {
        _selectedOptions.remove(3);
        if (isSelected) {
          _selectedOptions.add(index);
        } else {
          _selectedOptions.remove(index);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        const Text(
          '¿Tienes alguna restricción\ndiética especial?',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        const Text(
          'Selecciona las que apliquen para hoy.',
          style: TextStyle(fontSize: 15, color: Colors.black54),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: ListView.builder(
            itemCount: _options.length,
            itemBuilder: (context, index) {
              final option = _options[index];
              final isSelected = _selectedOptions.contains(index);

              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFFFA366).withOpacity(0.1)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFFFFA366)
                            : Colors.black12,
                      ),
                    ),
                    child: CheckboxListTile(
                      value: isSelected,
                      onChanged: (val) => _handleToggle(index, val ?? false),
                      title: Text(
                        option.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      subtitle: option.subtitle.isNotEmpty
                          ? Text(
                              option.subtitle,
                              style: const TextStyle(fontSize: 13),
                            )
                          : null,
                      activeColor: const Color(0xFFFFA366),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  if (index == 4 && isSelected)
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 16,
                        left: 8,
                        right: 8,
                      ),
                      child: CustomInput(
                        label: 'Especifica tu restricción:',
                        controller: _otraController,
                      ),
                    ),
                ],
              );
            },
          ),
        ),
        const Text(
          'Este ajuste se puede modificar en el menú de salud',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.black45),
        ),
      ],
    );
  }
}

class _RestrictionOption {
  final String title;
  final String subtitle;
  const _RestrictionOption({required this.title, required this.subtitle});
}
