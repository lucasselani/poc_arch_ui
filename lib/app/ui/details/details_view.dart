import 'package:flutter/material.dart';
import 'package:poc_ui_arch/app/domain/get_item_use_case.dart';

class DetailsView extends StatelessWidget {
  final Item item;
  const DetailsView({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(item.title),
        ),
      );
}
