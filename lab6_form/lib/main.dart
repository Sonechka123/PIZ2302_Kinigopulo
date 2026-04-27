import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Лабораторная 6',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  String gender = 'Женский';
  bool agreement = false;

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      if (!agreement) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Необходимо согласие на обработку данных'),
          ),
        );
        return;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Форма успешно отправлена')));
    }
  }

  void resetForm() {
    _formKey.currentState!.reset();
    nameController.clear();
    ageController.clear();
    emailController.clear();

    setState(() {
      gender = 'Женский';
      agreement = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Форма регистрации'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'ФИО',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите ФИО';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Возраст',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите возраст';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Возраст должен быть числом';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите email';
                  }
                  if (!value.contains('@')) {
                    return 'Email должен содержать @';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              const Text('Пол:'),

              RadioListTile(
                title: const Text('Женский'),
                value: 'Женский',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),

              RadioListTile(
                title: const Text('Мужской'),
                value: 'Мужской',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),

              CheckboxListTile(
                title: const Text('Согласие на обработку данных'),
                value: agreement,
                onChanged: (value) {
                  setState(() {
                    agreement = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: submitForm,
                child: const Text('Отправить'),
              ),

              TextButton(onPressed: resetForm, child: const Text('Сбросить')),
            ],
          ),
        ),
      ),
    );
  }
}
