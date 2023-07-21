import 'package:flutter/material.dart';

/// TODO: Tirar strings da tela
/// Tirar lógica da tela
class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
        ),
        body: Center(
          child: SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Voltar'),
            ),
          ),
        ),
      );
}
