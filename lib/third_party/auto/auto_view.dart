import 'package:flutter/material.dart';

class AutoView extends StatelessWidget {
  const AutoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text('Tela de automóveis'),
        ),
      );
}
