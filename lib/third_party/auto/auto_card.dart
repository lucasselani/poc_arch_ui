import 'package:flutter/material.dart';
/// TODO: Fazer lógica de controlar esse card fora da main
/// TODO: Adicionar FF para esconder/exibir
/// TODO: Adicionar navegação
/// TODO: Adicionar eventos
/// TODO: Notificar a tela principal para ela mandar info para o perfil
class AutoCard extends StatelessWidget {
  const AutoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: 46,
          child: Card(
            color: Colors.yellow.shade200,
            child: const Center(child: Text('Ir para automóveis')),
          ),
        ),
      );
}
