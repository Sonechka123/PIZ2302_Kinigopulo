import '../classes/Machine.dart';

void main() {
  final machine = Machine();

  machine.makeEspresso();
  machine.makeCappuccino();
  machine.makeLatte();

  machine.addResources(coffeeBeans: 500, milk: 500, water: 500);

  machine.makeLatte();

  machine.takeCash();
}
