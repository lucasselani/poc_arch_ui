import 'package:flutter/material.dart';

/// TODO: Fazer lógica de controlar esse card fora da main
/// TODO: Adicionar FF para esconder/exibir
/// TODO: Adicionar navegação
/// TODO: Adicionar eventos
/// TODO: Notificar a tela principal para ela mandar info para o perfil
class DocsCard extends StatelessWidget {
  const DocsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: 46,
          child: Card(
            color: Colors.greenAccent.shade200,
            child: const Center(child: Text('Ir para documentos')),
          ),
        ),
      );
}
