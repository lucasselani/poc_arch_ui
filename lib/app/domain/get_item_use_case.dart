import 'dart:math';

class GetItemUseCase {
  List<Item> get({int length = 20}) => List.generate(
        length,
        (index) => Item(
          'Item $index',
          _randomizeDesc(),
          _randomizeIsOn(),
        ),
      );

  bool _randomizeIsOn() => Random().nextBool();

  String _randomizeDesc() => Random().nextDouble().toString();
}

class Item {
  final String title;
  final String description;
  final bool isOn;

  Item(this.title, this.description, this.isOn);
}
