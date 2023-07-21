import 'package:flutter/material.dart';
import 'package:poc_ui_arch/app/ui/home/child/header/header_widget.dart';
import 'package:poc_ui_arch/app/ui/home/parent/home_controller.dart';
import 'package:poc_ui_arch/app/ui/home/parent/home_state.dart';
import 'package:poc_ui_arch/third_party/client_card.dart';

import '../child/button/button_widget.dart';
import '../child/list/list_widget.dart';
import '../child/switch_button/switch_widget.dart';

/// Delegar o controle para cada Widget ou concentrar na controller?
/// TODO: Implementar pull to refresh
/// Implementar estados de loading, error, success
/// Tirar todas as Strings da tela
class HomeView extends StatelessWidget {
  final controller = HomeController();

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        floatingActionButton:
            controller.state is SuccessHomeState ? const ButtonWidget() : null,
        body: () {
          if (controller.state is SuccessHomeState) {
            return _SuccessView();
          }
          if (controller.state is ErrorHomeState) {
            return const Center(
              child: Text('Error'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }());
  }
}

class _SuccessView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => RefreshIndicator(
        onRefresh: () async {},
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: const [
                SizedBox(height: 16),
                HeaderWidget(),
                SizedBox(height: 16),
                SwitchWidget(isOn: true),
                SizedBox(height: 16),
                ListWidget(items: []),
                SizedBox(height: 16),
                SizedBox(height: 16),
                ClientCard(),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      );
}
