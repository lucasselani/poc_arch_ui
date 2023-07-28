import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:poc_ui_arch/app/domain/get_item_use_case.dart';
import 'package:poc_ui_arch/app/ui/details/details_view.dart';
import 'package:poc_ui_arch/app/ui/home/child/list/list_controller.dart';
import 'package:poc_ui_arch/app/ui/home/parent/home_view.dart';
import 'package:poc_ui_arch/app/ui/settings/settings_view.dart';
import 'package:poc_ui_arch/core/analytics.dart';

void main() {
  Analytics.instance = AnalyticsImpl();
  GetIt.I.registerFactory<ListController>(() => ListController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: (settings) =>
          MaterialPageRoute(builder: (_) => _generateRouteWidget(settings)),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }

  Widget _generateRouteWidget(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return HomeView();
      case '/details':
        return DetailsView(item: settings.arguments as Item);
      case '/settings':
        return const SettingsView();
      default:
        return const Text('invalid');
    }
  }
}
