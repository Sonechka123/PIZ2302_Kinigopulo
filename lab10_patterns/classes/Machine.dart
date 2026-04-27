import '../enums/CoffeeType.dart';
import 'Americano.dart';
import 'Cappuccino.dart';
import 'Espresso.dart';
import 'ICoffee.dart';
import 'Resources.dart';

class Machine {
  int _coffeeBeans = 1000;
  int _milk = 1000;
  int _water = 1000;
  int _cash = 0;

  ICoffee createCoffee(CoffeeType type) {
    switch (type) {
      case CoffeeType.espresso:
        return Espresso();
      case CoffeeType.cappuccino:
        return Cappuccino();
      case CoffeeType.americano:
        return Americano();
    }
  }

  bool isAvailable(Resources r) {
    return _coffeeBeans >= r.coffeeBeans &&
        _milk >= r.milk &&
        _water >= r.water;
  }

  void makingCoffee(CoffeeType type) {
    final coffee = createCoffee(type);
    final r = coffee.resources();

    if (isAvailable(r)) {
      _coffeeBeans -= r.coffeeBeans;
      _milk -= r.milk;
      _water -= r.water;
      _cash += coffee.price();

      print('${coffee.name()} готов');
    } else {
      print('Недостаточно ресурсов');
    }
  }
}
