import 'package:flutter/material.dart';
import 'package:poc_ui_arch/app/ui/home/child/header/header_widget.dart';
import 'package:poc_ui_arch/app/ui/home/parent/home_controller.dart';
import 'package:poc_ui_arch/app/ui/home/parent/home_state.dart';
import 'package:poc_ui_arch/third_party/auto/auto_card.dart';
import 'package:poc_ui_arch/third_party/docs/docs_card.dart';

import '../child/button/button_widget.dart';
import '../child/list/list_widget.dart';
import '../child/switch_button/switch_widget.dart';

/// Delegar o controle para cada Widget ou concentrar na controller?
/// TODO: Implementar pull to refresh
/// TODO: Implementar estados de loading, error, success
/// TODO: Tirar todas as Strings da tela
class HomeView extends StatelessWidget {
  final controller = HomeController();

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.fetch();
    return ValueListenableBuilder(
        valueListenable: controller.state,
        builder: (_, __, ___) {
          final state = controller.state.value;
          return Scaffold(
              appBar: AppBar(title: Text(state!.appBarTitle)),
              floatingActionButton:
                  state is SuccessHomeState ? const ButtonWidget() : null,
              body: () {
                if (state is SuccessHomeState) {
                  return _SuccessView(
                    state: state,
                    controller: controller,
                  );
                }
                if (state is ErrorHomeState) {
                  return _ErrorView(
                    state: state,
                    controller: controller,
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }());
        });
  }
}

class _ErrorView extends StatelessWidget {
  final HomeController controller;
  final ErrorHomeState state;

  const _ErrorView({super.key, required this.state, required this.controller});

  @override
  Widget build(BuildContext context) => Center(
        child: GestureDetector(
          onTap: () => controller.fetch(),
          child: Text(
            state.errorMessage,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      );
}

class _SuccessView extends StatelessWidget {
  final HomeController controller;
  final SuccessHomeState state;

  const _SuccessView(
      {super.key, required this.state, required this.controller});

  @override
  Widget build(BuildContext context) => RefreshIndicator(
        onRefresh: controller.fetch,
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 16),
                HeaderWidget(header: state.header),
                _displayListIfNotEmpty(),
                const SizedBox(height: 16),
                const AutoCard(),
                const SizedBox(height: 16),
                const DocsCard(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      );

  Widget _displayListIfNotEmpty() => state.filteredItems.isEmpty
      ? const SizedBox.shrink()
      : Column(
          children: [
            const SizedBox(height: 16),
            SwitchWidget(
              isOn: state.isFilterOn,
              onChanged: controller.onFilterChanged,
            ),
            const SizedBox(height: 16),
            ListWidget(items: state.filteredItems),
          ],
        );
}
