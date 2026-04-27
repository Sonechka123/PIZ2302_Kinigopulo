class Machine {
  int _coffeeBeans;
  int _milk;
  int _water;
  int _cash;

  Machine({
    int coffeeBeans = 1000,
    int milk = 1000,
    int water = 1000,
    int cash = 0,
  }) : _coffeeBeans = coffeeBeans,
       _milk = milk,
       _water = water,
       _cash = cash;

  int get coffeeBeans => _coffeeBeans;
  int get milk => _milk;
  int get water => _water;
  int get cash => _cash;

  set coffeeBeans(int value) => _coffeeBeans = value;
  set milk(int value) => _milk = value;
  set water(int value) => _water = value;
  set cash(int value) => _cash = value;

  bool isAvailable({
    required int coffeeBeans,
    required int milk,
    required int water,
  }) {
    return _coffeeBeans >= coffeeBeans && _milk >= milk && _water >= water;
  }

  void addResources({
    required int coffeeBeans,
    required int milk,
    required int water,
  }) {
    _coffeeBeans += coffeeBeans;
    _milk += milk;
    _water += water;
    print('Ресурсы добавлены');
  }

  void takeCash() {
    print('Инкассация: $_cash руб.');
    _cash = 0;
  }

  void makeEspresso() {
    _makeCoffee(
      name: 'Эспрессо',
      coffeeBeans: 30,
      milk: 0,
      water: 100,
      price: 100,
    );
  }

  void makeCappuccino() {
    _makeCoffee(
      name: 'Капучино',
      coffeeBeans: 30,
      milk: 150,
      water: 100,
      price: 150,
    );
  }

  void makeLatte() {
    _makeCoffee(
      name: 'Латте',
      coffeeBeans: 30,
      milk: 250,
      water: 100,
      price: 180,
    );
  }

  void _makeCoffee({
    required String name,
    required int coffeeBeans,
    required int milk,
    required int water,
    required int price,
  }) {
    if (isAvailable(coffeeBeans: coffeeBeans, milk: milk, water: water)) {
      _coffeeBeans -= coffeeBeans;
      _milk -= milk;
      _water -= water;
      _cash += price;

      print('$name готов');
      print('Остаток кофе: $_coffeeBeans');
      print('Остаток молока: $_milk');
      print('Остаток воды: $_water');
      print('Деньги в кассе: $_cash');
    } else {
      print('Недостаточно ресурсов для приготовления $name');
    }
  }
}
