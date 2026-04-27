import '../classes/Machine.dart';
import '../enums/CoffeeType.dart';

void main() {
  final machine = Machine();

  machine.makingCoffee(CoffeeType.espresso);
  machine.makingCoffee(CoffeeType.cappuccino);
  machine.makingCoffee(CoffeeType.americano);
}
