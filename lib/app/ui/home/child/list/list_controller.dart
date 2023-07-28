import 'package:flutter/foundation.dart';
import 'package:poc_ui_arch/app/domain/get_item_use_case.dart';
import 'package:poc_ui_arch/app/ui/home/child/list/list_state.dart';
import 'package:poc_ui_arch/core/analytics.dart';

class ListController {
  final ValueNotifier<ListState> notifier = ValueNotifier(ListEmptyState());

  init(List<Item> items) {
    if (items.isEmpty) {
      notifier.value = ListEmptyState();
    } else {
      notifier.value =
          ListSuccessState(false, items, items, 'Filtrar desabilitados');
    }
  }

  void onFilterChanged(bool isOn) {
    Analytics.instance.logEvent(name: 'filter_clicked_$isOn');
    if (notifier.value is! ListSuccessState) return;
    final currentState = notifier.value as ListSuccessState;
    final newItems = isOn
        ? currentState.allItems.where((item) => item.isOn).toList()
        : currentState.allItems;
    notifier.value = ListSuccessState(
        isOn, currentState.allItems, newItems, currentState.switchLabel);
  }
}
