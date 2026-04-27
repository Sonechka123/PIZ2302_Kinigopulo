import '../enums/CoffeeType.dart';
import 'Americano.dart';
import 'Cappuccino.dart';
import 'CoffeeProcess.dart';
import 'Espresso.dart';
import 'ICoffee.dart';
import 'Resources.dart';

class Machine {
  int _coffeeBeans = 1000;
  int _milk = 1000;
  int _water = 1000;
  int _cash = 0;

  final CoffeeProcess process = CoffeeProcess();

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

  Future<void> makingCoffee(CoffeeType type) async {
    final coffee = createCoffee(type);
    final r = coffee.resources();

    if (!isAvailable(r)) {
      print('Недостаточно ресурсов для ${coffee.name()}');
      return;
    }

    _coffeeBeans -= r.coffeeBeans;
    _milk -= r.milk;
    _water -= r.water;
    _cash += coffee.price();

    print('Начинаем приготовление: ${coffee.name()}');

    await process.heatWater();
    await process.brewCoffee();

    if (r.milk > 0) {
      await process.whipMilk();
      await process.mixCoffeeAndMilk();
    }

    print('${coffee.name()} готов');
    print('Касса: $_cash рублей');
  }
}
