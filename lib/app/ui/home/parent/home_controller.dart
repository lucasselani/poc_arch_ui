import 'package:flutter/material.dart';
import 'package:poc_ui_arch/app/domain/get_header_use_case.dart';
import 'package:poc_ui_arch/app/domain/get_item_use_case.dart';
import 'package:poc_ui_arch/app/ui/home/parent/home_state.dart';
import 'package:poc_ui_arch/core/analytics.dart';

class HomeController {
  final ValueNotifier<HomeState?> state = ValueNotifier(null);

  void onFilterChanged(bool isOn) {
    Analytics.instance.logEvent(name: 'filter_clicked_$isOn');
    if (state.value is! SuccessHomeState) return;
    final currentState = state.value as SuccessHomeState;
    final newItems = isOn
        ? currentState.allItems.where((item) => item.isOn).toList()
        : currentState.allItems;
    state.value =
        currentState.filter(filteredItems: newItems, isFilterOn: isOn);
  }

  Future<void> fetch() async {
    _toLoadingState();
    final results =
        await Future.wait([GetItemUseCase().get(), GetHeaderUseCase().get()]);
    if (results.last == null) {
      return _toErrorState();
    }
    return _toSuccessState(
        allItems: results.first as List<Item>?, header: results.last as Header);
  }

  void _toLoadingState() {
    state.value = LoadingHomeState('Home');
  }

  void _toErrorState() {
    state.value = ErrorHomeState('Home', 'Erro ao carregar a home');
  }

  void _toSuccessState(
      {required List<Item>? allItems, required Header header}) {
    final list = allItems ?? [];
    state.value = SuccessHomeState(
      'Home',
      allItems: list,
      header: header,
      isFilterOn: false,
      filteredItems: list,
    );
  }
}
