import 'package:flutter/material.dart';

/// TODO: Filtrar lista
/// Enviar eventos
/// Tirar strings da tela
class SwitchWidget extends StatelessWidget {
  final bool isOn;

  const SwitchWidget({super.key, required this.isOn});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            const Expanded(child: Text('Filtrar desabilitados')),
            Switch(value: isOn, onChanged: (value) {}),
          ],
        ),
      ),
    );
  }
}
