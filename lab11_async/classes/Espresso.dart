import 'ICoffee.dart';
import 'Resources.dart';

class Espresso implements ICoffee {
  @override
  String name() => 'Эспрессо';

  @override
  Resources resources() {
    return Resources(coffeeBeans: 50, milk: 0, water: 100);
  }

  @override
  int price() => 100;
}
