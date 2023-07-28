import 'package:flutter/material.dart';
import 'package:poc_ui_arch/app/ui/home/child/header/header_widget.dart';
import 'package:poc_ui_arch/app/ui/home/child/list/list_component.dart';
import 'package:poc_ui_arch/app/ui/home/parent/home_controller.dart';
import 'package:poc_ui_arch/app/ui/home/parent/home_state.dart';
import 'package:poc_ui_arch/third_party/auto/auto_card.dart';
import 'package:poc_ui_arch/third_party/docs/docs_card.dart';

import '../child/button/button_widget.dart';

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
                ListComponent(
                    items: state.allItems ?? [],
                    onFilterChanged: (isOn) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('$isOn')));
                    }),
                _displayServices(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      );

  Widget _displayServices() => const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Text(
            'Serviços',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16),
          AutoCard(),
          SizedBox(height: 16),
          DocsCard(),
        ],
      );
}
