import 'package:flutter/material.dart';

class DocsView extends StatelessWidget {
  const DocsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text('Tela de documentos'),
        ),
      );
}
