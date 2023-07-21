import 'package:flutter/material.dart';

/// TODO: Implementar navegação
/// TODO: Implementar eventos
class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.settings),
      );
}
