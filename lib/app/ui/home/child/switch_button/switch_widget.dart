import 'package:flutter/material.dart';

/// TODO: Filtrar lista
/// TODO: Enviar eventos
/// TODO: Tirar strings da tela
class SwitchWidget extends StatelessWidget {
  final bool isOn;
  final void Function(bool) onChanged;

  const SwitchWidget({
    super.key,
    required this.isOn,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            const Expanded(child: Text('Filtrar desabilitados')),
            Switch(value: isOn, onChanged: onChanged),
          ],
        ),
      ),
    );
  }
}
