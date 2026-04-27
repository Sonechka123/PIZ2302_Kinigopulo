import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Лабораторная 5',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ListPage(),
    );
  }
}

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Apple',
      'Banana',
      'Orange',
      'Mango',
      'Pineapple',
      'Grapes',
      'Cherry',
      'Peach',
      'Watermelon',
      'Strawberry',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Список')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.list),
            title: Text(items[index]),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Выбрано: ${items[index]}')),
              );
            },
          );
        },
      ),
    );
  }
}
