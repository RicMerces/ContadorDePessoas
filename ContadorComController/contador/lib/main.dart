import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MyApp> {
  final controller = CounterControler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CounterWidget(controler: controller),
            ElevatedButton(
              onPressed: controller.increment,
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key, required this.controler}) : super(key: key);

  final CounterControler controler;

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  String contador = '0';

  @override
  void initState() {
    super.initState();
    widget.controler.addListener(() {
      setState(() {
        contador = widget.controler.count.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(contador);
  }
}

class CounterControler extends ChangeNotifier {
  int _counter = 0;
  int get count => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
}
