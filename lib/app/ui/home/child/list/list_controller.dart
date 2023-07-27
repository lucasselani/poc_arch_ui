import 'package:flutter/foundation.dart';
import 'package:poc_ui_arch/app/domain/get_item_use_case.dart';
import 'package:poc_ui_arch/app/ui/home/child/list/list_state.dart';
import 'package:poc_ui_arch/core/analytics.dart';

class ListController {
  late final ValueNotifier<ListState> notifier;

  ListController(List<Item> items, bool isOn) {
    _initialize(items, isOn);
  }

  void _initialize(List<Item> items, bool isOn) {
    if (items.isEmpty) {
      notifier = ValueNotifier(ListEmptyState());
    } else {
      notifier = ValueNotifier(
          ListSuccessState(isOn, items, items, 'Filtrar desabilitados'));
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
