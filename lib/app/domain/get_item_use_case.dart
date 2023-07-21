import 'dart:math';

class GetItemUseCase {
  Future<List<Item>?> get({int length = 20}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (Random().nextBool()) {
      return List.generate(
        length,
        (index) => Item(
          'Item $index',
          _randomizeDesc(),
          _randomizeIsOn(),
        ),
      );
    }
    return null;
  }

  bool _randomizeIsOn() => Random().nextBool();

  String _randomizeDesc() => Random().nextDouble().toString();
}

class Item {
  final String title;
  final String description;
  final bool isOn;

  Item(this.title, this.description, this.isOn);
}
