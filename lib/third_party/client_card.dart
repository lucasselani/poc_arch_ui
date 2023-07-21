import 'package:flutter/material.dart';

/// TODO: Fazer lógica de controlar esse card fora da main
/// Adicionar FF para esconder/exibir
/// Adicionar navegação
/// Adicionar eventos
/// Notificar a tela principal para exibir um Snackbar
class ClientCard extends StatelessWidget {
  const ClientCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: 46,
          child: Card(
            color: Colors.yellow.shade200,
            child: const Center(child: Text('Ir para cliente X')),
          ),
        ),
      );
}
