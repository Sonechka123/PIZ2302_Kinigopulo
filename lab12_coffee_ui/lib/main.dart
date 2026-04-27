import 'package:flutter/material.dart';

void main() {
  runApp(const CoffeeApp());
}

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Кофемашина',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown),
      home: const CoffeePage(),
    );
  }
}

class CoffeePage extends StatefulWidget {
  const CoffeePage({super.key});

  @override
  State<CoffeePage> createState() => _CoffeePageState();
}

class _CoffeePageState extends State<CoffeePage> {
  int coffeeBeans = 1000;
  int milk = 1000;
  int water = 1000;
  int cash = 0;

  String status = 'Выберите напиток';

  void makeCoffee({
    required String name,
    required int coffee,
    required int milkNeed,
    required int waterNeed,
    required int price,
  }) {
    if (coffeeBeans >= coffee && milk >= milkNeed && water >= waterNeed) {
      setState(() {
        coffeeBeans -= coffee;
        milk -= milkNeed;
        water -= waterNeed;
        cash += price;
        status = '$name готов';
      });
    } else {
      setState(() {
        status = 'Недостаточно ресурсов для $name';
      });
    }
  }

  void addResources() {
    setState(() {
      coffeeBeans += 500;
      milk += 500;
      water += 500;
      status = 'Ресурсы пополнены';
    });
  }

  void takeCash() {
    setState(() {
      cash = 0;
      status = 'Касса очищена';
    });
  }

  Widget resourceCard(String title, int value, IconData icon) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.brown),
        title: Text(title),
        trailing: Text(
          value.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget coffeeButton({
    required String name,
    required int coffee,
    required int milkNeed,
    required int waterNeed,
    required int price,
  }) {
    return ElevatedButton(
      onPressed: () {
        makeCoffee(
          name: name,
          coffee: coffee,
          milkNeed: milkNeed,
          waterNeed: waterNeed,
          price: price,
        );
      },
      child: Text('$name — $price руб.'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Кофемашина'),
        backgroundColor: Colors.brown,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            status,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          resourceCard('Кофейные зерна', coffeeBeans, Icons.coffee),
          resourceCard('Молоко', milk, Icons.local_drink),
          resourceCard('Вода', water, Icons.water_drop),
          resourceCard('Касса', cash, Icons.payments),

          const SizedBox(height: 20),

          coffeeButton(
            name: 'Эспрессо',
            coffee: 50,
            milkNeed: 0,
            waterNeed: 100,
            price: 100,
          ),

          coffeeButton(
            name: 'Капучино',
            coffee: 50,
            milkNeed: 200,
            waterNeed: 100,
            price: 150,
          ),

          coffeeButton(
            name: 'Американо',
            coffee: 50,
            milkNeed: 0,
            waterNeed: 200,
            price: 120,
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: addResources,
            child: const Text('Пополнить ресурсы'),
          ),

          TextButton(onPressed: takeCash, child: const Text('Очистить кассу')),
        ],
      ),
    );
  }
}
