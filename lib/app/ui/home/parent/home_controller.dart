import 'package:flutter/material.dart';
import 'package:poc_ui_arch/app/domain/get_header_use_case.dart';
import 'package:poc_ui_arch/app/domain/get_item_use_case.dart';
import 'package:poc_ui_arch/app/ui/home/parent/home_state.dart';

class HomeController {
  final ValueNotifier<HomeState?> state = ValueNotifier(null);

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
    state.value = SuccessHomeState(
      'Home',
      allItems: allItems,
      header: header,
    );
  }
}
