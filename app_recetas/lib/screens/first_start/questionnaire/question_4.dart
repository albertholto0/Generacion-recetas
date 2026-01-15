import 'question_5.dart';
import 'package:flutter/material.dart';
import '/widgets/progress_bar.dart';
import '/widgets/next_button.dart';

class Question4Screen extends StatefulWidget {
  const Question4Screen({super.key});

  @override
  State<Question4Screen> createState() => _Question4ScreenState();
}

class _Question4ScreenState extends State<Question4Screen> {
  final Set<int> _selectedOptions = {};

  final List<_RestrictionOption> _options = const [
    _RestrictionOption(
      title: 'Picante',
      subtitle: 'Necesito evitar alimentos picantes',
    ),
    _RestrictionOption(
      title: 'Lácteos',
      subtitle: 'Necesito evitar alimentos con leche',
    ),
    _RestrictionOption(title: 'Dieta blanda', subtitle: 'Me encuentro enfermo'),
    _RestrictionOption(title: 'Ninguna por el momento', subtitle: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              const Text(
                'Paso 4 de 5',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(height: 8),
              Center(child: CustomProgressBar(value: 0.8)),
              const SizedBox(height: 24),
              const Text(
                'Tu o alguien de tu familia,\n¿Tiene alguna restricción\ntemporal de salud?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Image.asset(
                'assets/no-comer.png',
                height: 150,
                fit: BoxFit.contain,
              ),
              ...List.generate(_options.length, (index) {
                final option = _options[index];
                final isNinguna = index == _options.length - 1;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 1),
                  child: CheckboxListTile(
                    value: _selectedOptions.contains(index),
                    onChanged: (checked) {
                      setState(() {
                        if (isNinguna) {
                          if (checked == true) {
                            _selectedOptions
                              ..clear()
                              ..add(index);
                          } else {
                            _selectedOptions.remove(index);
                          }
                        } else {
                          if (checked == true) {
                            _selectedOptions.add(index);
                            _selectedOptions.remove(_options.length - 1);
                          } else {
                            _selectedOptions.remove(index);
                          }
                        }
                      });
                    },
                    title: Text(
                      option.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: option.subtitle.isNotEmpty
                        ? Text(
                            option.subtitle,
                            style: const TextStyle(fontSize: 13),
                          )
                        : null,
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                  ),
                );
              }),
              const SizedBox(height: 8),
              const Text(
                'Este ajuste se puede modificar\nfácilmente en el menú de salud',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.black45),
              ),
              const Spacer(),
              NextButton(
                onPressed: _selectedOptions.isNotEmpty
                    ? () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Question5Screen(),
                          ),
                        );
                      }
                    : null,
                text: 'Siguiente',
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _RestrictionOption {
  final String title;
  final String subtitle;
  const _RestrictionOption({required this.title, required this.subtitle});
}
