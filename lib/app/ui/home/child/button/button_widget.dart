import 'package:flutter/material.dart';

/// TODO: Navegar para Settings
/// Implementar eventos
class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.settings),
      );
}
