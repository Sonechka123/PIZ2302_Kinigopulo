import 'ICoffee.dart';
import 'Resources.dart';

class Cappuccino implements ICoffee {
  @override
  String name() => 'Капучино';

  @override
  Resources resources() {
    return Resources(coffeeBeans: 50, milk: 200, water: 100);
  }

  @override
  int price() => 150;
}
