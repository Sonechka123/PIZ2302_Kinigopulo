import 'ICoffee.dart';
import 'Resources.dart';

class Americano implements ICoffee {
  @override
  String name() => 'Американо';

  @override
  Resources resources() {
    return Resources(coffeeBeans: 50, milk: 0, water: 200);
  }

  @override
  int price() => 120;
}
