import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Лабораторная работа 4',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const Lab4Page(),
    );
  }
}

class Lab4Page extends StatefulWidget {
  const Lab4Page({super.key});

  @override
  State<Lab4Page> createState() => _Lab4PageState();
}

class _Lab4PageState extends State<Lab4Page> {
  int likes = 41;

  void addLike() {
    setState(() {
      likes++;
    });
  }

  void showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    const String longText =
        'Студенческий городок или так называемый кампус Кубанского ГАУ состоит '
        'из двадцати общежитий, в которых проживает более 8000 студентов, что '
        'составляет 96% от всех нуждающихся. Студенты первого курса обеспечены '
        'местами в общежитии полностью. В соответствии с Положением о студенческих '
        'общежитиях университета, при поселении между администрацией и студентами '
        'заключается договор найма жилого помещения. Воспитательная работа в '
        'общежитиях направлена на улучшение быта, соблюдение правил внутреннего '
        'распорядка, отсутствия асоциальных явлений в молодежной среде. Условия '
        'проживания в общежитиях университетского кампуса полностью отвечают '
        'санитарным нормам и требованиям: наличие оборудованных кухонь, душевых '
        'комнат, прачечных, читальных залов, комнат самоподготовки, помещений для '
        'заседаний студенческих советов и наглядной агитации. С целью улучшения '
        'условий быта студентов активно работает система студенческого самоуправления '
        '- студенческие советы организуют всю работу по самообслуживанию.';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Кубанский ГАУ'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          Image.network(
            'https://kubsau.ru/upload/iblock/4e1/4e1742f8dc3ad5d8a5d3013b08809bfb.jpg',
            height: 240,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Студенческий городок КубГАУ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Краснодар, Россия',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: addLike,
                  icon: const Icon(Icons.favorite, color: Colors.red),
                ),
                Text('$likes'),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton(
                icon: Icons.call,
                label: 'Позвонить',
                onPressed: () {
                  showMessage('Нажата кнопка Позвонить');
                },
              ),
              _buildButton(
                icon: Icons.near_me,
                label: 'Маршрут',
                onPressed: () {
                  showMessage('Нажата кнопка Маршрут');
                },
              ),
              _buildButton(
                icon: Icons.share,
                label: 'Поделиться',
                onPressed: () {
                  showMessage('Нажата кнопка Поделиться');
                },
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              longText,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.green)),
        ],
      ),
    );
  }
}
