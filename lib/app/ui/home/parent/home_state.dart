import 'package:poc_ui_arch/app/domain/get_header_use_case.dart';
import 'package:poc_ui_arch/app/domain/get_item_use_case.dart';

abstract class HomeState {
  final String appBarTitle;

  HomeState(this.appBarTitle);
}

class SuccessHomeState extends HomeState {
  final List<Item>? allItems;
  final Header header;

  SuccessHomeState(
    super.appBarTitle, {
    required this.allItems,
    required this.header,
  });
}

class ErrorHomeState extends HomeState {
  final String errorMessage;

  ErrorHomeState(super.appBarTitle, this.errorMessage);
}

class LoadingHomeState extends HomeState {
  LoadingHomeState(super.appBarTitle);
}
