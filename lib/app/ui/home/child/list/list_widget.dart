import 'package:flutter/material.dart';
import 'package:poc_ui_arch/app/domain/get_item_use_case.dart';

/// TODO: Implementar eventos
/// TODO: Implementar click no item, navegar para Details via namedRoute
class ListWidget extends StatelessWidget {
  final List<Item> items;

  const ListWidget({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) => ListItemWidget(item: items[index]),
        separatorBuilder: (_, index) => const Divider(thickness: 1),
        itemCount: items.length,
      );
}

class ListItemWidget extends StatelessWidget {
  final Item item;

  const ListItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(item.title),
        subtitle: Text(item.description),
        leading: _createIcon(),
      );

  Widget _createIcon() {
    if (item.isOn) {
      return const Icon(Icons.check, size: 16);
    }
    return const Icon(Icons.close, size: 16);
  }
}
