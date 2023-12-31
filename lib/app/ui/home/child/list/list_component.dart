import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:poc_ui_arch/app/domain/get_item_use_case.dart';
import 'package:poc_ui_arch/app/ui/home/child/list/list_controller.dart';
import 'package:poc_ui_arch/app/ui/home/child/list/list_state.dart';
import 'package:poc_ui_arch/app/ui/home/child/list/list_widget.dart';
import 'package:poc_ui_arch/app/ui/home/child/list/switch_widget.dart';

class ListComponent extends StatelessWidget {
  final ListController controller;
  final void Function(bool) onFilterChanged;

  ListComponent({
    super.key,
    required List<Item> items,
    required this.onFilterChanged,
  }) : controller = GetIt.I<ListController>()..init(items);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.notifier,
      builder: (_, __, ___) {
        if (controller.notifier.value is ListEmptyState) {
          return const SizedBox.shrink();
        }
        final state = controller.notifier.value as ListSuccessState;
        return Column(
          children: [
            const SizedBox(height: 16),
            SwitchWidget(
                isOn: state.isOn,
                onChanged: (isOn) {
                  onFilterChanged(isOn);
                  controller.onFilterChanged(isOn);
                }),
            const SizedBox(height: 16),
            ListWidget(items: state.filteredItems),
          ],
        );
      },
    );
  }
}
