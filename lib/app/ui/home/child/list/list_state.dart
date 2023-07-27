import 'package:poc_ui_arch/app/domain/get_item_use_case.dart';

sealed class ListState {}

class ListSuccessState extends ListState {
  final bool isOn;
  final List<Item> allItems;
  final List<Item> filteredItems;
  final String switchLabel;

  ListSuccessState(
      this.isOn, this.allItems, this.filteredItems, this.switchLabel);
}

class ListEmptyState extends ListState {}
