class CoffeeProcess {
  Future<void> heatWater() async {
    print('Нагрев воды...');
    await Future.delayed(const Duration(seconds: 3));
    print('Вода нагрета');
  }

  Future<void> brewCoffee() async {
    print('Заваривание кофе...');
    await Future.delayed(const Duration(seconds: 5));
    print('Кофе заварен');
  }

  Future<void> whipMilk() async {
    print('Взбивание молока...');
    await Future.delayed(const Duration(seconds: 5));
    print('Молоко взбито');
  }

  Future<void> mixCoffeeAndMilk() async {
    print('Смешивание кофе и молока...');
    await Future.delayed(const Duration(seconds: 3));
    print('Кофе и молоко смешаны');
  }
}
