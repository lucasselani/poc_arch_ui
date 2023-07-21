import 'dart:math';

class GetHeaderUseCase {
  Future<Header?> get() async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (Random().nextBool()) {
      return Header('Lucas Selani', 'lucas.selani@unico.io');
    }
    return null;
  }
}

class Header {
  final String title;
  final String subtitle;

  Header(this.title, this.subtitle);
}
