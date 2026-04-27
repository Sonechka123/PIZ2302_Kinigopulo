import '../classes/Machine.dart';
import '../enums/CoffeeType.dart';

Future<void> main() async {
  final machine = Machine();

  await machine.makingCoffee(CoffeeType.espresso);
  await machine.makingCoffee(CoffeeType.cappuccino);
  await machine.makingCoffee(CoffeeType.americano);
}
